function [next_voltage,P_term,I_term,D_term,pid_correction] = calculate_next_voltage_pid(desired_force, measured_force, current_voltage, dt,kp,ki,kd)
    % Calculates the corrected voltage waveform for the next run using Iterative PID.
    
    % Force all inputs to be column vectors to prevent implicit expansion crashes
    desired_force = desired_force(:);
    measured_force = measured_force(:);
    current_voltage = current_voltage(:);

    % 1. PID Tuning Parameters (Start small!)
    Kp = kp;   % Proportional gain
    Ki = ki;  % Integral gain
    Kd = kd; % Derivative gain
    max_safe_voltage = 10; % Absolute safety limit for the shaker amplifier

    % 2. Calculate the raw error array
    error_signal = desired_force - measured_force;

    % Create a time vector for integration and differentiation
    N = length(error_signal);
    time_array = (0:N-1)' * dt; % Transposed to match column vector format

    % 3. Proportional Term (P)
    P_term = Kp .* error_signal;

    % 4. Integral Term (I)
    I_term = Ki .* cumtrapz(time_array, error_signal);

    % 5. Derivative Term (D) with Zero-Phase Filtering
    if Kd > 0
        Nyquist = (1/dt) / 2;
        cutoff_freq = 100; % Hz
        
        % Safety check to prevent filter crash
        if cutoff_freq >= Nyquist
            warning('Cutoff frequency must be less than Nyquist. Defaulting to Nyquist * 0.9');
            cutoff_freq = Nyquist * 0.9;
        end
        
        Wn = cutoff_freq / Nyquist;
        [b, a] = butter(2, Wn, 'low');
        
        filtered_error = filtfilt(b, a, error_signal);
        
        % Calculate the numerical derivative
        D_term = Kd .* gradient(filtered_error, dt);
    else
        D_term = zeros(size(error_signal));
    end

    % 6. Calculate the total PID correction waveform
    pid_correction = P_term + I_term + D_term;

    % % Shift the correction backward in time by your shaker's delay (e.g., 4 samples)
    % N_shift = 4; 
    % pid_correction_advanced = circshift(pid_correction, -N_shift);
    % pid_correction_advanced(end-N_shift+1:end) = 0;

    % 7. Apply the correction to the previous voltage waveform
    next_voltage = current_voltage - pid_correction;

    % 8. Apply strict safety limits to prevent overdriving the shaker
    next_voltage = max(min(next_voltage, max_safe_voltage), -max_safe_voltage);
end