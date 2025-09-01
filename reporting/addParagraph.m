function addParagraph(doc, stylename, text, nvp)

arguments
    doc
    stylename
    text
    nvp.Move (1,1) logical = true
end

import mlreportgen.dom.Paragraph

p = Paragraph(text, stylename);
if nvp.Move
    moveToNextHole(doc);
end
append(doc, p);

end