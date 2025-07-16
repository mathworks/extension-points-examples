classdef testCallbacks < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        function testOpenMyFunction(testCase)
            import matlab.unittest.constraints.ContainsSubstring;
             % Capture the command window output
            actualOutput = evalc('openMyFunction');

            % Define the expected output message
            expectedMessagePart = "Opening 'myWorkingFile.m' in the Editor...";

            % Verify that the expected message is contained in the actual output
            testCase.verifyThat(actualOutput, ContainsSubstring(expectedMessagePart), ...
                'The output message for openMyFunction was not as expected.');
        end

        % Contains unit tests for the callback functions used in extensions.json
        function testCustomMenuItemCallback(testCase)
            import matlab.unittest.constraints.ContainsSubstring;
            % Create a mock callbackInfo object
            callbackInfo = struct();
            callbackInfo.Context = struct();
            
            % Define some mock file paths
            callbackInfo.Context.selectedFilePaths = {'myWorkingFile.m', 'anotherFile.m'};

            % Capture the command window output when calling the function
            actualOutput = evalc('customMenuItemCallback(callbackInfo)');

            % Define the expected parts of the output.
            expectedOutputParts = {
                "Custom menu item callback called for the following selection:",
                "myWorkingFile.m",
                "anotherFile.m"
            };

            % Verify that each expected part is present in the actual output
            for i = 1:length(expectedOutputParts)
                testCase.verifyThat(actualOutput, ContainsSubstring(expectedOutputParts{i}), ...
                    sprintf('Output did not contain expected part: "%s"', expectedOutputParts{i}));
            end
        end
    end

end