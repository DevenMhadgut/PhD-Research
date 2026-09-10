function [data] = import_data(EXP, packet_id)
% import_data - Opens and loads UPS_1 Binary data packet files
% This function opens every binary file (name: packet_index.BIN) in a
% folder (name: 0xPacket_ID). It then strips and checks the packet header
% and crc footer and concatenates the data into a single array
% 
% Syntax:  
%     [data] = import_data(EXP, packet_id)
% 
% Inputs:
%    EXP - The directory in which the packet id folders are contained
%    packet_id - The packet id to have its binary files opened
% 
% Outputs:
%    imu_data - all experiment data found in binary files in packet id
%    folder. If packet id folder does not exist, returns an empty array
% 
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
% 
% See also: DataConverter.m

% Author: Patrick Thomas
% Affiliation: Virginia Tech
% email: thomaspj1017@vt.edu
% Created: 03-Apr-2023 ; Last revision: 03-Apr-2023 

% ------------- BEGIN CODE --------------


    data = [];
    files = dir(fullfile([EXP '\' packet_id], '*.bin'));
    if isempty(files)
       return
    end
    folder = files(1).folder;
    for i = 1:length(files)
        fileName = [folder '\' num2str(i-1) '.BIN'];
        fileId = fopen(fileName);
        data_tmp = fread(fileId, 'uint8');
        if ((data_tmp(2)*256 + data_tmp(3) + 1) ~= i)
           fprintf('Raw Data Error in Packet: %d Index: %d\n', data_tmp(1), (data_tmp(2)*256 + data_tmp(3))); 
        end
        if (i == 1)
            data = data_tmp(4:end-1,1);
        else
            data = [data; data_tmp(4:end-1,1)];
        end
        fclose(fileId);
    end
end
% ------------- END OF CODE --------------


% ------------- END OF CODE --------------
