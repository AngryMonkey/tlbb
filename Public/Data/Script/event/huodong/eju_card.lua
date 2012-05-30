--�����
--���ۻ��

x808061_g_ScriptId						= 808061
x808061_g_SportsPrize_Active	= 0			--Ĭ�Ϲر�

x808061_g_ActiveStartTime			= 7168	--20070618
--x808061_g_ActiveEndTime			= 7198	--20070718

function x808061_SportsCard(sceneId,selfId,targetId)
	--�Ƿ��Ѿ���ȡ���������½���
	if GetMissionFlag( sceneId, selfId, MF_ActiveJuCard ) == 1 then
		x808061_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ���ȡ��������������ظ���ȡ��" )
		return
	end
	
	--�Ƿ����20��
	if GetLevel( sceneId, selfId ) < 5 then
		x808061_NotifyFailBox( sceneId, selfId, targetId, "    �����ĵȼ�����5����������ȡ�������" )
		return
	end
	
	--��鱳���ռ�
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
		x808061_NotifyFailBox( sceneId, selfId, targetId, "    �Բ�����û���㹻����Ʒ���ռ䣬�������������ȡ��" )
		return
	end

	--�����뿨�Ž���
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 2006 )		
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x808061_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--���ʱ��
--**********************************
function x808061_CheckRightTime()
	local DayTime = GetDayTime()
	--PrintNum(DayTime)
	if DayTime < x808061_g_ActiveStartTime then
		x808061_g_SportsPrize_Active = 0
		return 0    --��ǰ�ǻʱ��
	end

--if DayTime > x808061_g_ActiveEndTime then
--	x808061_g_SportsPrize_Active = 0
--	return 0    --�˺��Ѿ�����
--end

	x808061_g_SportsPrize_Active = 1
	return 1
end

--**********************************
--�о��¼�
--**********************************
function x808061_OnEnumerate( sceneId, selfId, targetId )
    x808061_CheckRightTime()
	  if 1 == x808061_g_SportsPrize_Active then
			AddNumText(sceneId, x808061_g_ScriptId, "��ȡ���ۻ�齱����", 1, 1 )
    end
end

--**********************************
--������ں���
--**********************************
function x808061_OnDefaultEvent( sceneId, selfId, targetId )
	x808061_CheckRightTime()
	if 1 ~= x808061_g_SportsPrize_Active then
		return
	end

	local TextNum = GetNumText()

	if TextNum == 1 then
		x808061_SportsCard( sceneId, selfId, targetId )
	end
end
