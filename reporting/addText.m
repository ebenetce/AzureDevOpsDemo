function hole = addText(doc, stylename, text)
import mlreportgen.dom.Text

p = Text(text, stylename);
moveToNextHole(doc);
append(doc, p);
hole = doc.CurrentHoleId;

end