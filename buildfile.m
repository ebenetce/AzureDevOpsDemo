function plan = buildfile
import matlab.buildtool.tasks.CodeIssuesTask
import matlab.buildtool.tasks.TestTask

% Create a plan from task functions
plan = buildplan(localfunctions);

% Add the "check" task to identify code issues
plan("check") = CodeIssuesTask;

% Add the "test" task to run tests
plan("test") = TestTask;

% Make the "archive" task the default task in the plan
plan.DefaultTasks = "archive";

% Make the "archive" task dependent on the "check" and "test" tasks
plan("publish").Dependencies = ["check" "test"];
end

function publishTask(~)

import mlreportgen.dom.*
import mlreportgen.report.*

close all force;
dynare Smets_Wouters_2007_45.mod nolog nowarn

f1 = findobj('Name', 'Prior Slope of the Phillips Curve');
f2 = findobj('Name','Historical shock decomposition: y.');

doc = Document('reporting/MyReport', 'docx', 'reporting/dnbtemplate.dotx');
open(doc);

title = 'My New Model';
addParagraph(doc, 'TitlePage', title);
addText(doc, 'Year', title);
addText(doc, 'Year', title);
addText(doc, 'Year', string(year(datetime('now'))));
addParagraph(doc, 'Authors', 'Eduard Benet Cerdà');
moveToNextHole(doc)
addParagraph(doc, 'MainTitle', title);
addParagraph(doc, 'Authors2', 'Eduard Benet');
addParagraph(doc, 'Date2', string(datetime('now', 'Format', 'MMMM d,yyyy')));
addParagraph(doc, 'Abstract', getPlaceHolderText())
addText(doc, 'Keywords', 'Model, Dynare');
addText(doc, 'Classification', 'C30, E10, E17');

moveToNextHole(doc)

addParagraph(doc, 'Heading 1', 'Introduction', Move = false)
addParagraph(doc, 'Normal', getPlaceHolderText(), Move = false)

exportgraphics(f1, 'reporting/fig1.png')
exportgraphics(f2, 'reporting/fig2.png')
plot1 = Image("reporting/fig1.png");
plot1.Width = "6in";
plot1.Height = "3in";
append(doc,plot1);

addParagraph(doc, 'Heading 1', 'A global view of the New Model', Move = false)
addParagraph(doc, 'Normal', getPlaceHolderText(), Move = false)
plot2 = Image("reporting/fig2.png");
plot2.Width = "6in";
plot2.Height = "3in";
append(doc,plot2);
close(doc)
end