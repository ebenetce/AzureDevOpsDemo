classdef tModel < matlab.unittest.TestCase

    methods (Test)

        function tSWModel(tc)
           
            prj = currentProject();
            cd(prj.RootFolder)
            dynare Smets_Wouters_2007_45.mod nolog
            tc.verifyTrue(isfile('Smets_Wouters_2007_45/Output/Smets_Wouters_2007_45_results.mat'))
            
        end

    end

end