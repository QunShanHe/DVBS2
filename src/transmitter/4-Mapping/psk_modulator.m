classdef psk_modulator < matlab.System
    % psk modulator Phase Shift Keying of input message.
    
    % NOTE: When renaming the class name untitled2, the file name
    % and constructor name must be updated to use the class name.
    %
    % This template includes most, but not all, possible properties, attributes,
    % and methods that you can implement for a System object in Simulink.

    % Public, tunable properties
    properties
        order = 8;
        amplitude = 1;
        frame_size = 64800;
    end

    % Public, non-tunable properties
    properties(Nontunable)

    end

    properties(DiscreteState)

    end

    % Pre-computed constants
    properties(Access = private)

    end

    methods
        % Constructor
        function obj = psk_modulator(varargin)
            % Support name-value pair arguments when constructing object
            setProperties(obj,nargin,varargin{:})
        end
    end

    methods(Access = protected)
        %% Common functions
        function setupImpl(obj)
            % Perform one-time calculations, such as computing constants
        end

        function [I, Q] = stepImpl(obj, frame)
            % Implement algorithm. 
            num_of_bits = log2(obj.order);
            input_size = [length(frame)/num_of_bits num_of_bits];
            I = zeros(length(frame)/num_of_bits, 1);
            Q = zeros(length(frame)/num_of_bits, 1);
            frame_reshape = reshape(frame, input_size);
            for index = 1:height(frame_reshape)
                [i, q] = psk_modulate(frame_reshape(index, :), obj.amplitude);
                I(index) = i;
                Q(index) = q;
            end
        end

        %% Backup/restore functions
        function loadObjectImpl(obj,s,wasLocked)
            % Set properties in object obj to values in structure s

            % Set private and protected properties
            % obj.myproperty = s.myproperty; 

            % Set public properties and states
            loadObjectImpl@matlab.System(obj,s,wasLocked);
        end

        %% Simulink functions
        function ds = getDiscreteStateImpl(obj)
            % Return structure of properties with DiscreteState attribute
            ds = struct([]);
        end

        function out = getOutputSizeImpl(obj)
            % Return size for each output port
            out = [obj.frame_size/log2(obj.order) 2];
        end
    end

    methods(Static, Access = protected)
        %% Simulink customization functions
        function header = getHeaderImpl
            % Define header panel for System block dialog
            header = matlab.system.display.Header(mfilename("class"));
        end

        function group = getPropertyGroupsImpl
            % Define property section(s) for System block dialog
            group = matlab.system.display.Section(mfilename("class"));
        end
    end
end
