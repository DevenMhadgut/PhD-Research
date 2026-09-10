% DataCoverter - Converts UPS_1 binary packet files to usavel data
%   This Program allows you to select a folder containing UPS_1 data
%   packets subdivided into folders based on Packet ID. The program
%   imports the raw binary data from the packets then converts to the
%   appropriate units, i.e. G's for accelerometer data and DPS for
%   gyroscope data. Finally the program saves image data as jpegs and
%   all other data in a Data.mat file in the folder containing the packets 
% 
% Inputs:
%    uigetdir - select folder where UPS_1 Binary Packet files are stored
%    
% 
% Outputs:
%    Data.mat - .mat file containing post processed data:
%       - Encoder position (rad) and time
%       - IMU A Gyroscope data (dps) and time
%       - IMU A Accelermeter data (G's) and time
%       - IMU BoomTip Gyroscope data (dps) and time
%       - IMU BoomTip Accelermeter data (G's) and time
%       - Experiment MetaData struct containing labeled metadata
%    post_deployment_img.jpg - Image from after boom deployment
%    pre_deployment_img.jpg - Image from befor boom deployment
%    7 figures plotting IMU and encoder data from deployment
% 
% 
% Other m-files required: 
%   - imort_data.m
%   - convert_raw_imu.m
% Subfunctions: none
% MAT-files required: none
%
% Author: Patrick Thomas
% Affiliation: Virginia Tech
% email: thomaspj1017@vt.edu
% Created: 31-Mar-2023 ; Last revision: 03-Apr-2023 

% ------------- BEGIN CODE --------------


clc, clear all, close all
% *--- User Input Setting's ---*
EXP             = uigetdir;
XL_FS           = 4;        % Accelerometer fullscale   (G's)
GYR_FS          = 500;      % Gyroscope fullscale       (?/s)
IMU_NUM_BITS    = 15;       % Bits
IMU_P_fs        = 832;      % Boomtip IMU sample frequency (Hz)
IMU_A_XL_fs     = 800;      % PCM accel IMU sample frequency (Hz)
IMU_A_GYR_fs    = 200;      % PCM gyro IMU sample frequency (Hz)
ENC_DT          = 500e-6;   % s
plot_data       = true;

% --- Packet ID's ---
XP_MD = '11';
XP_IMU_P_XL = '12';
XP_IMU_P_GYR = '13';
XP_IMU_A_XL = '14';
XP_IMU_A_GYR = '15';
XP_ENC = '1a';
XP_PIC_1 = '1b';
XP_PIC_2 = '1c';

% --- Import Raw Binary Data ---
IMU_P_XL_RAW    = import_data(EXP, XP_IMU_P_XL);
IMU_P_GYR_RAW   = import_data(EXP, XP_IMU_P_GYR);
IMU_A_XL_RAW    = import_data(EXP, XP_IMU_A_XL);
IMU_A_GYR_RAW   = import_data(EXP, XP_IMU_A_GYR);
XP_ENC_RAW      = import_data(EXP, XP_ENC);
XP_PIC_1_RAW    = import_data(EXP, XP_PIC_1);
XP_PIC_2_RAW    = import_data(EXP, XP_PIC_2);
XP_MD_RAW       = import_data(EXP, XP_MD);

% --- Convert Raw Binary Data to usable units ---
IMU_P_XL    = convert_raw_imu(IMU_P_XL_RAW, XL_FS, IMU_NUM_BITS);
IMU_A_XL    = convert_raw_imu(IMU_A_XL_RAW, XL_FS, IMU_NUM_BITS);
IMU_P_GYR   = convert_raw_imu(IMU_P_GYR_RAW, GYR_FS, IMU_NUM_BITS);
IMU_A_GYR   = convert_raw_imu(IMU_A_GYR_RAW, GYR_FS, IMU_NUM_BITS);
IMU_P_XL    = [[1:1:length(IMU_P_XL)]'/IMU_P_fs, IMU_P_XL];
IMU_A_XL    = [[1:1:length(IMU_A_XL)]'/IMU_A_XL_fs, IMU_A_XL];
IMU_P_GYR   = [[1:1:length(IMU_P_GYR)]'/IMU_P_fs, IMU_P_GYR];
IMU_A_GYR   = [[1:1:length(IMU_A_GYR)]'/IMU_A_GYR_fs, IMU_A_GYR];

% -- Form MetaData struct from raw binary data ---
MetaData.PCM_status.Proxy_board_coms_faults     = bitand(XP_MD_RAW(1), 0x01, 'uint8') > 0;
MetaData.PCM_status.IMU_A_fault                 = bitand(XP_MD_RAW(1), 0x02, 'uint8') > 0;
MetaData.PCM_status.IMU_B_fault                 = bitand(XP_MD_RAW(1), 0x04, 'uint8') > 0;
MetaData.PCM_status.IMU_C_fault                 = bitand(XP_MD_RAW(1), 0x08, 'uint8') > 0;
MetaData.PCM_status.Encoder_fault               = bitand(XP_MD_RAW(1), 0x10, 'uint8') > 0;
MetaData.PCM_status.timeour_fault               = bitand(XP_MD_RAW(1), 0x20, 'uint8') > 0;
MetaData.Proxy_status.IMU_init_fault            = bitand(XP_MD_RAW(2), 0x01, 'uint8') > 0;
MetaData.Proxy_status.Flash_mem_fault           = bitand(XP_MD_RAW(2), 0x02, 'uint8') > 0;
MetaData.Proxy_status.Brown_out                 = bitand(XP_MD_RAW(2), 0x04, 'uint8') > 0;
MetaData.Proxy_status.IMU_FIFO_overflow         = bitand(XP_MD_RAW(2), 0x08, 'uint8') > 0;
MetaData.Proxy_status.PCM_UART_fault            = bitand(XP_MD_RAW(2), 0x10, 'uint8') > 0;
MetaData.time.Proxy_start       = 62.5e-6*(XP_MD_RAW(6) + 2^8 * XP_MD_RAW(5) + 2^16 * XP_MD_RAW(4) + 2^24 * XP_MD_RAW(3));
MetaData.time.Proxy_end         = 62.5e-6*(XP_MD_RAW(10) + 2^8 * XP_MD_RAW(9) + 2^16 * XP_MD_RAW(8) + 2^24 * XP_MD_RAW(7));
MetaData.temp.Boom_IMU          = (XP_MD_RAW(11) + 256*(XP_MD_RAW(12) - 256*(XP_MD_RAW(12) >= 128)))/256 + 25;
MetaData.num_packets.Boom_IMU_XL = XP_MD_RAW(13) + 256*XP_MD_RAW(14);
MetaData.num_packets.Boom_IMU_GYR = XP_MD_RAW(15) + 256*XP_MD_RAW(16);
MetaData.time.PCM_end           = (XP_MD_RAW(17) + 2^8 * XP_MD_RAW(18) + 2^16 * XP_MD_RAW(19) + 2^24 * XP_MD_RAW(20));
MetaData.time.PCM_start         = (XP_MD_RAW(21) + 2^8 * XP_MD_RAW(22) + 2^16 * XP_MD_RAW(23) + 2^24 * XP_MD_RAW(24));
MetaData.num_packets.IMU_A_XL   = XP_MD_RAW(25) + 256*XP_MD_RAW(26);
MetaData.num_packets.IMU_A_GYR  = XP_MD_RAW(27) + 256*XP_MD_RAW(28);
MetaData.temp.IMU_A             = (XP_MD_RAW(29) + 256*(XP_MD_RAW(30) - 256*(XP_MD_RAW(30) >= 128)))/2^9 + 23;
MetaData.num_packets.IMU_B_XL   = XP_MD_RAW(31) + 256*XP_MD_RAW(32);
MetaData.num_packets.IMU_B_GYR  = XP_MD_RAW(33) + 256*XP_MD_RAW(34);
MetaData.temp.IMU_B             = (XP_MD_RAW(35) + 256*(XP_MD_RAW(36) - 256*(XP_MD_RAW(36) >= 128)))/2^9 + 23;
MetaData.num_packets.IMU_C_XL   = XP_MD_RAW(37) + 256*XP_MD_RAW(38);
MetaData.num_packets.IMU_C_GYR  = XP_MD_RAW(39) + 256*XP_MD_RAW(40);
MetaData.temp.IMU_C             = (XP_MD_RAW(41) + 256*(XP_MD_RAW(42) - 256*(XP_MD_RAW(42) >= 128)))/2^9 + 23;
MetaData.num_packets.Encoder    = XP_MD_RAW(43);
MetaData.encoder_start          = XP_MD_RAW(44);
MetaData.encoder_end            = XP_MD_RAW(45);
MetaData.num_packets.pic_1      = XP_MD_RAW(46) + 256*XP_MD_RAW(47);
MetaData.num_packets.pic_2      = XP_MD_RAW(48) + 256*XP_MD_RAW(49);

% --- Encoder data processing ---
ENC_DELTA_T = ENC_DT*(XP_ENC_RAW(2:2:end) + 256*(XP_ENC_RAW(1:2:end) - 256*(XP_ENC_RAW(1:2:end)>=128)));
ENC_DELTA_STEP = round(ENC_DELTA_T / (1/IMU_A_XL_fs));
ENCODER = zeros(length(IMU_A_XL), 2);
ENCODER(:,1) = [1:1:length(IMU_A_XL)]'/IMU_A_XL_fs;
k = 1;
if (MetaData.encoder_end > 150)
    MetaData.encoder_end = 6;
end
for i = 1:MetaData.encoder_end
    ENCODER(k:k+ENC_DELTA_STEP(i), 2) = i - 1;
    k = ENC_DELTA_STEP(i) + k +1;
end
ENCODER(k:end, 2) = MetaData.encoder_end;
ENCODER(:,2) = ENCODER(:,2)/24*2*pi;

% --- Save raw binary jpg data as jpg files ---
XP_PIC_1_RAW = cast(XP_PIC_1_RAW(1:find(XP_PIC_1_RAW == 217, 1, 'last')), 'uint8');
filName = [EXP '\pre_deployment_img.jpg'];
fileId = fopen(filName, 'w+');
fwrite(fileId, XP_PIC_1_RAW);
fclose(fileId);
XP_PIC_2_RAW = cast(XP_PIC_2_RAW(1:find(XP_PIC_2_RAW == 217, 1, 'last')), 'uint8');
filName = [EXP '\post_deployment_img.jpg'];
fileId = fopen(filName, 'w+');
fwrite(fileId, XP_PIC_2_RAW);
fclose(fileId); 
filName = [EXP '\Data.mat'];
save(filName, 'IMU_A_XL', 'IMU_A_GYR', 'IMU_P_XL', 'IMU_P_GYR', 'ENCODER', 'MetaData');

% --- Plot Boom deployment data vs time ---
if(plot_data)
    figure(1);
    plot(IMU_P_XL(:,1), sqrt(IMU_P_XL(:,2).^2 + IMU_P_XL(:,3).^2 + IMU_P_XL(:,4).^2), '-.');
    figure(2);
    plot(IMU_A_XL(:,1), sqrt(IMU_A_XL(:,2).^2 + IMU_A_XL(:,3).^2 + IMU_A_XL(:,4).^2), '-.');
    figure(3);
    plot(ENCODER(:,1), ENCODER(:,2), '-.');
    figure(4);
    plot(IMU_P_XL(:,1), IMU_P_XL(:,2), '.', IMU_P_XL(:,1), IMU_P_XL(:,3), '.', IMU_P_XL(:,1), IMU_P_XL(:,4), '.');
    figure(5);
    plot(IMU_P_GYR(:,1), IMU_P_GYR(:,2), '.', IMU_P_GYR(:,1), IMU_P_GYR(:,3), '.', IMU_P_GYR(:,1), IMU_P_GYR(:,4), '.');
    figure(6);
    plot(IMU_A_XL(:,1), IMU_A_XL(:,2), IMU_A_XL(:,1), IMU_A_XL(:,3), IMU_A_XL(:,1), IMU_A_XL(:,4));
    figure(7);
    plot(IMU_A_GYR(:,1), IMU_A_GYR(:,2), IMU_A_GYR(:,1), IMU_A_GYR(:,3), IMU_A_GYR(:,1), IMU_A_GYR(:,4))
end

% ------------- END OF CODE --------------
