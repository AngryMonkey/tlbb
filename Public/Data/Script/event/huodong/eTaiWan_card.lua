--�����
--���ۻ��

x808077_g_ScriptId						= 808077
x808077_g_SportsPrize_Active	= 0			--Ĭ�Ϲر�

x808077_g_ActiveStartTime			= 7168	--20070618


function x808077_SportsCard(sceneId,selfId,targetId)
	--�Ƿ��Ѿ���ȡ���������½���
	--if GetMissionFlag( sceneId, selfId, MF_ActiveJuCard ) == 1 then
	--	x808077_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ���ȡ��������������ظ���ȡ��" )
	--	return
	--end
	
	--�Ƿ����20��
	--if GetLevel( sceneId, selfId ) < 5 then
	--	x808077_NotifyFailBox( sceneId, selfId, targetId, "    �����ĵȼ�����5����������ȡ�������" )
	--	return
	--end
	
	--��鱳���ռ�
	--local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	--if( FreeSpace < 1 ) then
	--	x808077_NotifyFailBox( sceneId, selfId, targetId, "    �Բ�����û���㹻����Ʒ���ռ䣬�������������ȡ��" )
	--	return
	--end

	--�����뿨�Ž���
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 2007950 )		
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x808077_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--���ʱ��
--**********************************
function x808077_CheckRightTime()
	--local DayTime = GetDayTime()
	--PrintNum(DayTime)
	--if DayTime < x808077_g_ActiveStartTime then
	--	x808077_g_SportsPrize_Active = 0
	--	return 0    --��ǰ�ǻʱ��
	--end

--if DayTime > x808077_g_ActiveEndTime then
--	x808077_g_SportsPrize_Active = 0
--	return 0    --�˺��Ѿ�����
--end

	x808077_g_SportsPrize_Active = 1
	return 1
end

--**********************************
--�о��¼�
--**********************************
function x808077_OnEnumerate( sceneId, selfId, targetId )
    x808077_CheckRightTime()
	  if 1 == x808077_g_SportsPrize_Active then
			AddNumText(sceneId, x808077_g_ScriptId, "#{CB_XUBAO_LINGQU_1}", 1, 1 )
    end
end

--**********************************
--������ں���
--**********************************
function x808077_OnDefaultEvent( sceneId, selfId, targetId )
	x808077_CheckRightTime()
	if 1 ~= x808077_g_SportsPrize_Active then
		return
	end

	local TextNum = GetNumText()

	if TextNum == 1 then
		x808077_SportsCard( sceneId, selfId, targetId )
	end
end
