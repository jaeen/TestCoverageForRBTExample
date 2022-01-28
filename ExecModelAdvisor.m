function result = ExecModelAdvisor
model = 'cruiseControlRBTCovExample';
load_system(model);
% Get model advisor handle
MdlAdvHandle = Simulink.ModelAdvisor.getModelAdvisor(model);
% BaselineMode false is for verification, true is for baseline
% generation
MdlAdvHandle.setBaselineMode(true);
% As an example, here we only select the check of choice 'Check solver for
% code generation'
%MdlAdvHandle.deselectCheckAll;
success = selectCheckAll(MdlAdvHandle);
%print(success);
%MdlAdvHandle.selectCheck('Check solver for code generation');
% Run the selected check
allIDs = MdlAdvHandle.getCheckAll;
MdlAdvHandle.runCheck;
% Get check result

res = MdlAdvHandle.getCheckResult(allIDs)
result = MdlAdvHandle.getCheckResult('Check solver for code generation');
