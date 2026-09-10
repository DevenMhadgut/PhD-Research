function [imu_data] = convert_raw_imu(raw_imu_data, imu_fs, imu_num_bits)
% convert_raw_imu - Converts raw binary imu data into usable units
% This function takes an array of raw binary imu data in little endian
% format as well as the full scale range from 0 that the data was collected
% under and the number of bits used to represent the range from 0 to full
% scale (i.e. total number of bits minus 1)
% 
% Syntax:  
%     [imu_data] = convert_raw_imu(raw_imu_data, imu_fs, imu_num_bits)
% 
% Inputs:
%    raw_imu_data - 3*2*n x 1 vector of binary imu data in little endian
%    format
%    imu_fs - full scale imu data range from 0 to max
%    imu_num_bits - the number of bits used to represent the range from 0 
%    to full scale (i.e. total number of bits minus 1)
% 
% Outputs:
%    imu_data - nx3 matrix of IMU data in usable format
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


raw_imu_data_signed = raw_imu_data(1:2:end) + 256*(raw_imu_data(2:2:end) - 256*(raw_imu_data(2:2:end)>=128));
imu_data(:,1) = raw_imu_data_signed(1:3:end)*imu_fs/(2^imu_num_bits);
imu_data(:,2) = raw_imu_data_signed(2:3:end)*imu_fs/(2^imu_num_bits);
imu_data(:,3) = raw_imu_data_signed(3:3:end)*imu_fs/(2^imu_num_bits);
end


% ------------- END OF CODE --------------
