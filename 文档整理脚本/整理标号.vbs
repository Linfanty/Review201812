const ForWriting = 2
fn = wscript.arguments(0)
set fso = createobject("scripting.filesystemobject")
if fso.FileExists(fn) then
    set inStrm = fso.OpenTextFile(fn)
    if instr(fn,".")<=instr(fn,"\") then
        msgbox "�϶��������ļ������ı��ļ�����û���ڱ��ش洢",vbCritical,"����"
        wscript.quit 1
    end if
    newFileName = left(fn,instrrev(fn,"."))+"_proc.txt"
    set outStrm = fso.OpenTextFile(left(fn,instrrev(fn,"."))+"_proc.txt",ForWriting,true)
    set regex = new regexp
    inText = inStrm.ReadAll
    inStrm.Close
    with regex
        ' TODO: ������.NET�汾��ʹ��������ʽ����ƥ�䣺
        ' "(?<=[^\d]).{0}(?=\d+\.)"
        .Pattern = ".{0}(?=\d+\.)"
        .Global = true
        outStrm.Write .Replace(inText, vbCrLf)
    end with
    outStrm.Close
else
    msgbox "�϶�һ���ı��ļ����ű�",vbexclamation,"��������"
    wscript.quit 1
end if