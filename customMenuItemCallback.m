function customMenuItemCallback(callbackInfo)
%CUSTOMMENUITEMCALLBACK This function has a documented input param called 
% 'callbackInfo': which is an object that contains 'Context', which in-turn
% contains the selectedFilePaths.
% Use this information about the selected file paths to determine what this 
% callback is supposed to do, if required.
    disp("Custom menu item callback called for the following selection: ")
    disp(callbackInfo.Context.selectedFilePaths)
end