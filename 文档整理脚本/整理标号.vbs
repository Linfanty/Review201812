' �ļ���ģʽ
const ForWriting = 2

' Char.IsLatin1
Function IsLatin1(ch)
    IsLatin1 = AscW(ch) <= &HFF
End Function

' �ǲ��ǿհ�����1�ַ�
Function IsWhiteSpaceLatin1(c)
    ch=ascw(c)
    ' .NET Դ���д����
    ' return ch=32 orelse ch >= &H9 andalso ch <= &Hd orelse ch=&Ha0 orelse ch=&H85
    if ch=32 then
        IsWhiteSpaceLatin1=true
        exit Function
    elseif ch >= &H9 then
        if ch <= &Hd then
            IsWhiteSpaceLatin1=true
            exit Function
        end if
    elseif ch=&Ha0 then
        IsWhiteSpaceLatin1=true
        exit Function
    elseif ch=&H85 then
        IsWhiteSpaceLatin1=true
        exit Function
    end if
    IsWhiteSpaceLatin1=false
End Function

' ȥ����ʼ�հ��ַ�
Function TrimStart(strString)
    for i = 1 to len(strString)
        ch = mid(strString,i,1)
        if IsLatin1(ch) then
            if not IsWhiteSpaceLatin1(ch) then
                TrimStart = Mid(strString, i)
                exit Function
            end if
        elseif ch="��" then
        else
            exit for
        end if
    next
    TrimStart = strString
End Function

' ��ڵ�
Sub Main(args)
    if args.length < 1 then
        msgbox "�϶�����һ���ı��ļ����ű�",vbexclamation,"��������"
    	wscript.quit 1
    end if
    set fso = createobject("scripting.filesystemobject")
    set regex = new regexp
    with regex
        ' TODO: ������.NET�汾���ڱ��ʽǰ�������ٽ���ƥ�䣺
        ' (?<=[^\d])
        .Pattern = ".{0}(?=(\d+[\.����,]|[�٢ڢۢܢݢޢߢ���]))"
        .Global = true
    end with
    for each fn in args
        if fso.FileExists(fn) then
    	    set inStrm = fso.OpenTextFile(fn)
    	    if instr(fn,".")<=instr(fn,"\") then
    		    msgbox "�϶������Ĳ����ı��ļ�����û���ڱ��ش洢",vbCritical,"����"
    		    wscript.quit 1
    	    end if
    	    newFileName = left(fn,instrrev(fn,"."))+"_proc.txt"
    	    set outStrm = fso.OpenTextFile(left(fn,instrrev(fn,"."))+"_proc.txt",ForWriting,true)
    	    inText = inStrm.ReadAll
    	    inStrm.Close
            ' TODO: ������.NET�汾������Ҫ������ʼ��
    		outStrm.Write TrimStart(regex.Replace(inText, vbCrLf))
    	    outStrm.Close
        else
    	    msgbox "��һ�������ļ������ı��ļ�",vbexclamation,"��������"
    	    wscript.quit 1
        end if
    next
End Sub

Main wscript.arguments