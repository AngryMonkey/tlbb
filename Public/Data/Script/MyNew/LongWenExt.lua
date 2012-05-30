--�ű���
x892003_g_scriptId = 892003

--**********************************
-- 
--**********************************
function x892003_LevelUp(sceneId, selfId, lwIndex,lw2Index,cailiao)
	x892003_NotifyTip( sceneId, selfId, "Test1:"..lwIndex )
	x892003_NotifyTip( sceneId, selfId, "Test2:"..lw2Index )
	x892003_NotifyTip( sceneId, selfId, "Test3:"..cailiao )
	local lw = LuaFnGetItemTableIndexByIndex( sceneId, selfId, lwIndex )
	if lw==10157009 then
		x892003_NotifyTip( sceneId, selfId, "���������Ѵﵽ��߼�" )
		return
	end
	local lw2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, lw2Index )
	local icailiao = LuaFnGetItemTableIndexByIndex( sceneId, selfId, cailiao )
	local needCailiao=0
	if x892003_LWCheck( sceneId, selfId, lw )==0 or x892003_LWCheck( sceneId, selfId, lw2 )==0 then
		x892003_NotifyTip( sceneId, selfId, "�����װ����֧�ִ������������" )
		return
	end
	if lw~=lw2 then
		x892003_NotifyTip( sceneId, selfId, "�����2�����Ƶȼ�����ͬ" )
		return
	end
	if lw>=10157001 and lw<=10157003 then
		needCailiao=38000152
	elseif lw>=10157004 and lw<=10157006 then
		needCailiao=38000164
	elseif lw>=10157007 and lw<=10157009 then
		needCailiao=38000165
	end
	if icailiao~=needCailiao then
		x892003_NotifyTip( sceneId, selfId, "����Ĳ��������Ƶĵȼ�����" )
		return
	end
	local pos = TryRecieveItem( sceneId, selfId, lw+1, 1 )
	if pos==-1 then
		x892003_NotifyTip( sceneId, selfId, "�����ռ䲻��" )
		return
	end
	LuaFnEraseItem( sceneId, selfId, lwIndex )
	LuaFnEraseItem( sceneId, selfId, lw2Index )
	LuaFnEraseItem( sceneId, selfId, cailiao )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	x892003_NotifyTip( sceneId, selfId, "��ϲ�����ƺϳɳɹ�" )
	local lwLevel=lw-10157000
	local nam = LuaFnGetName( sceneId, selfId )
	if lwLevel>=4 then
		BroadMsgByChatPipe( sceneId, selfId, "#cff66cc[����ϵͳ]:#B��ϲ��� #cff0000"..nam.." #B�ϳɳ��� #cff0000"..tonumber(lwLevel+1).." #B�����ƣ�������������ƵĻ������ԡ�", 4 )
	end
end
--**********************************
-- 
--**********************************
function x892003_StudyProperty(sceneId, selfId, lwIndex)		
	local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, 30 )
	local lw = LuaFnGetItemTableIndexByIndex( sceneId, selfId, lwIndex )
	if itemIndex~=20310181 and itemIndex~=20310182 and itemIndex~=20310183 then
		x892003_NotifyTip( sceneId, selfId, "���ϲ���" )
		return
	end
	if LuaFnGetAvailableItemCount(sceneId, selfId, itemIndex)<10 then
		x892003_NotifyTip( sceneId, selfId, "���ϲ���" )
		return
	end
	if x892003_LWCheck( sceneId, selfId, lw )==0 then
		x892003_NotifyTip( sceneId, selfId, "�����װ����֧�ִ������������" )
		return
	end
	local longwen1 = GetMissionData( sceneId, selfId, MY_LONGWEN1 )
	local longwen2 = GetMissionData( sceneId, selfId, MY_LONGWEN2 )
	local longwen3 = GetMissionData( sceneId, selfId, MY_LONGWEN3 )
	if itemIndex==20310181 and longwen1>0 then
		x892003_NotifyTip( sceneId, selfId, "����ѧϰ������չ���ԣ��˴��޷������ȼ���" )
		return
	elseif itemIndex==20310182 and longwen2>0 then
		x892003_NotifyTip( sceneId, selfId, "����ѧϰ������չ���ԣ��˴��޷������ȼ���" )
		return
	elseif itemIndex==20310183 and longwen3>0 then
		x892003_NotifyTip( sceneId, selfId, "����ѧϰ������չ���ԣ��˴��޷������ȼ���" )
		return
	end
	local reply = CostMoney(sceneId,selfId,10000000)
	if reply == -1 then
		x892003_NotifyTip( sceneId, selfId, "��Ǯ����" )
		return
	end
	local r=random(0,3)
	if itemIndex==20310181 then
		DelItem(sceneId,selfId,itemIndex,10)
		SetMissionData( sceneId, selfId, MY_LONGWEN1, 1 )
	elseif itemIndex==20310182 then
		DelItem(sceneId,selfId,itemIndex,10)
		SetMissionData( sceneId, selfId, MY_LONGWEN2, 1+r*10 )
	elseif itemIndex==20310183 then
		DelItem(sceneId,selfId,itemIndex,10)
		SetMissionData( sceneId, selfId, MY_LONGWEN3, 1+r*10 )
	end
	CallScriptFunction( 892001, "GetLWInfo", sceneId, selfId )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	x892003_NotifyTip( sceneId, selfId, "��ϲ����չ����ѧϰ�ɹ�" )
end

function x892003_UpdateProperty(sceneId, selfId, lwIndex)
	local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, 30 )
	local lw = LuaFnGetItemTableIndexByIndex( sceneId, selfId, lwIndex )
	if x892003_LWCheck( sceneId, selfId, lw )==0 then
		x892003_NotifyTip( sceneId, selfId, "�����װ����֧�ִ������������" )
		return
	end

	if itemIndex~=20310181 and itemIndex~=20310182 and itemIndex~=20310183 then
		x892003_NotifyTip( sceneId, selfId, "���ϲ���" )
		return
	end
	local longwen1 = GetMissionData( sceneId, selfId, MY_LONGWEN1 )
	local longwen2 = GetMissionData( sceneId, selfId, MY_LONGWEN2 )
	local longwen3 = GetMissionData( sceneId, selfId, MY_LONGWEN3 )
	local l2=floor(longwen2/10)
	local l3=floor(longwen3/10)
	longwen2=longwen2-l2*10;
	longwen3=longwen3-l3*10;
	if itemIndex==20310181 and longwen1==0 then
		x892003_NotifyTip( sceneId, selfId, "��û��ѧϰ������չ���ԡ�" )
		return
	elseif itemIndex==20310182 and longwen2==0 then
		x892003_NotifyTip( sceneId, selfId, "��û��ѧϰ������չ���Ի�������󼶡�" )
		return
	elseif itemIndex==20310183 and longwen3==0 then
		x892003_NotifyTip( sceneId, selfId, "��û��ѧϰ������չ���Ի�������󼶡�" )
		return
	end
	if itemIndex==20310181 then
		if longwen1==10 then
			x892003_NotifyTip( sceneId, selfId, "����չ���������������ȼ�" )
			return
		end
		if LuaFnGetAvailableItemCount(sceneId, selfId, itemIndex)<(longwen1+1)*10 then
			x892003_NotifyTip( sceneId, selfId, "���ϲ���:�� "..longwen1.." �������� "..tonumber(longwen1+1).." ����Ҫ���� "..tonumber((longwen1+1)*10).." ��" )
		else
			local reply = CostMoney(sceneId,selfId,50000000)
			if reply == -1 then
				x892003_NotifyTip( sceneId, selfId, "��Ǯ����" )
				return
			end
			DelItem(sceneId,selfId,itemIndex,(longwen1+1)*10)
			SetMissionData( sceneId, selfId, MY_LONGWEN1, longwen1+1 )
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
			local	nam	= LuaFnGetName( sceneId, selfId )
			if longwen1==4 then
				BroadMsgByChatPipe( sceneId, selfId, "#cff66cc[����ϵͳ]:#Y��ϲ��� #G"..nam.." #Y������#B����#Y����չ����[#GѪ����#Y]������#cff0000"..tonumber(longwen1+1).."�������������#G����#Y�����ԡ�", 4 )
			end
			x892003_NotifyTip( sceneId, selfId, "��ϲ����չ���������ɹ�" )
			CallScriptFunction( 892001, "GetLWInfo", sceneId, selfId )
		end
		return
	elseif itemIndex==20310182 then
		if longwen2==0 then
			x892003_NotifyTip( sceneId, selfId, "��ûѧϰ����չ���������������ȼ�" )
			return
		end
		if LuaFnGetAvailableItemCount(sceneId, selfId, itemIndex)<(longwen2+1)*10 then
			x892003_NotifyTip( sceneId, selfId, "���ϲ���:�� "..longwen2.." �������� "..tonumber(longwen2+1).." ����Ҫ���� "..tonumber((longwen2+1)*10).." ��" )
		else
			local reply = CostMoney(sceneId,selfId,50000000)
			if reply == -1 then
				x892003_NotifyTip( sceneId, selfId, "��Ǯ����" )
				return
			end
			DelItem(sceneId,selfId,itemIndex,(longwen2+1)*10)
			SetMissionData( sceneId, selfId, MY_LONGWEN2, longwen2+1+l2*10 )
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
			if longwen2==4 then
				BroadMsgByChatPipe( sceneId, selfId, "#cff66cc[����ϵͳ]:#Y��ϲ��� #G"..nam.." #Y������#B����#Y����չ����[#G����Ŀ�꿹��#Y]������#cff0000"..tonumber(longwen2+1).."�������������#G����#Y�����ԡ�", 4 )
			end
			x892003_NotifyTip( sceneId, selfId, "��ϲ����չ���������ɹ�" )
			CallScriptFunction( 892001, "GetLWInfo", sceneId, selfId )
		end
		return
	elseif itemIndex==20310183 then
		if longwen3==10 then
			x892003_NotifyTip( sceneId, selfId, "����չ���������������ȼ�" )
			return
		end
		if LuaFnGetAvailableItemCount(sceneId, selfId, itemIndex)<(longwen3+1)*10 then
			x892003_NotifyTip( sceneId, selfId, "���ϲ���:�� "..longwen3.." �������� "..tonumber(longwen3+1).." ����Ҫ���� "..tonumber((longwen3+1)*10).." ��" )
		else
			local reply = CostMoney(sceneId,selfId,50000000)
			if reply == -1 then
				x892003_NotifyTip( sceneId, selfId, "��Ǯ����" )
				return
			end
			DelItem(sceneId,selfId,itemIndex,(longwen3+1)*10)
			SetMissionData( sceneId, selfId, MY_LONGWEN3, longwen3+1+l3*10 )
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
			if longwen3==4 then
				BroadMsgByChatPipe( sceneId, selfId, "#cff66cc[����ϵͳ]:#Y��ϲ��� #G"..nam.." #Y������#B����#Y����չ����[#G���Թ���#Y]������#cff0000"..tonumber(longwen3+1).."�������������#G����#Y�����ԡ�", 4 )
			end
			x892003_NotifyTip( sceneId, selfId, "��ϲ����չ���������ɹ�" )
			CallScriptFunction( 892001, "GetLWInfo", sceneId, selfId )
		end
		return
	end	
end

function x892003_ResetProperty(sceneId, selfId, lwIndex)
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)<1 then
		x892003_NotifyTip( sceneId, selfId, "ȱ�پ���ˮ" )
		return
	end
	local lw = LuaFnGetItemTableIndexByIndex( sceneId, selfId, lwIndex )
	if x892003_LWCheck( sceneId, selfId, lw )==0 then
		x892003_NotifyTip( sceneId, selfId, "�����װ����֧�ִ������������" )
		return
	end
	local longwen2 = GetMissionData( sceneId, selfId, MY_LONGWEN2 )
	local longwen3 = GetMissionData( sceneId, selfId, MY_LONGWEN3 )
	local l2=floor(longwen2/10)
	local l3=floor(longwen3/10)
	longwen2=longwen2-l2*10;
	longwen3=longwen3-l3*10;
	local r2=random(0,3)
	longwen2=longwen2+r2*10
	local r3=random(0,3)
	longwen3=longwen3+r3*10
	local reply = CostMoney(sceneId,selfId,10000000)
	if reply == -1 then
		x892003_NotifyTip( sceneId, selfId, "��Ǯ����" )
		return
	end

	DelItem(sceneId,selfId,20310180,1)
	SetMissionData( sceneId, selfId, MY_LONGWEN2, longwen2 )
	SetMissionData( sceneId, selfId, MY_LONGWEN3, longwen3 )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	x892003_NotifyTip( sceneId, selfId, "��ϲ�����Ƹ�����չ���Գɹ�" )
	CallScriptFunction( 892001, "GetLWInfo", sceneId, selfId )
end

--**********************************
--���Ƽ��
--**********************************
function x892003_LWCheck( sceneId, selfId, index )
	x892003_NotifyTip( sceneId, selfId, "Test:"..index )
	local flag=0
	if index>=10157001 and index<=10157010 then
		flag=1
	end
	return flag
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x892003_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x892003_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end
