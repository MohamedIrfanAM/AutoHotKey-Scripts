#Requires AutoHotkey v2.0
#Warn
!q:: 
{
	RegWrite 0, "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation"
	SendMessage "0x112", "0xF170", 2,, "Program Manager"
	sleep 1000
}

!+q::
{
	state := RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation")
	if(state == 1)
	{
		RegWrite 0, "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation"
	}
	else
	{
		RegWrite 1, "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation"
	}
}


!w::
{
	Send "!{f4}"
}

#m::
{	
	if(WinGetMinMax("A") == 1)
	{
		WinRestore "A"
	}
	else
	{
		WinMaximize "A"
	}
}

!m::
{
	WinMinimize "A"
}
!+m::
{
	Send "!{tab}"
}

#Enter::
{
	Run "wt.exe"
}

#+Enter::
{
	Run "edge.exe"
}

#^+Enter::
{
	RegWrite 1, "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableLockWorkstation"
	Run "D:\VMs\Arch\Arch.vbox"
}

^!l::
{
	Send "#^{Right}"
}
^!h::
{
	Send "#^{Left}"
}


#h::
{
	Send "!{tab}"
}

#l::
{
	Send "!{tab}"
}
