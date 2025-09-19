classdef tModel < matlab.unittest.TestCase

    methods (Test)

        function tSWModel(tc)

            w = [1 0 0; 0 1 0; 0 0 1];
            tc.verifyEqual(w, eye(3))
            
        end

    end

end