--�����
--�������¿�

x808060_g_ScriptId = 808060
x808060_g_SportsPrize_Active = 0   --Ĭ�Ϲر�

x808060_g_ActiveStartTime = 7154	 --20070604
x808060_g_ActiveEndTime = 7171		 --20070621

function x808060_SportsCard(sceneId,selfId,targetId)
	--�Ƿ��Ѿ���ȡ���������½���
	if GetMissionFlag( sceneId, selfId, MF_ActiveSportsCard ) == 1 then
		x808060_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ���ȡ��������������ظ���ȡ��" )
		return
	end
	
	--�Ƿ����20��
	if GetLevel( sceneId, selfId ) < 20 then
		x808060_NotifyFailBox( sceneId, selfId, targetId, "    �����ĵȼ�����20����������ȡ�������" )
		return
	end
	
	--��鱳���ռ�
	local FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
		x808060_NotifyFailBox( sceneId, selfId, targetId, "    �Բ�����û���㹻����Ʒ���ռ䣬�������������ȡ��" )
		return
	end

	--�����뿨�Ž���
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 2005 )		
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x808060_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--���ʱ��
--**********************************
function x808060_CheckRightTime()
	local DayTime = GetDayTime()
	--PrintNum(DayTime)
	if DayTime < x808060_g_ActiveStartTime then
		x808060_g_SportsPrize_Active = 0
		return 0    --��ǰ�ǻʱ��
	end

	if DayTime > x808060_g_ActiveEndTime then
  	x808060_g_SportsPrize_Active = 0
  	return 0    --�˺��Ѿ�����
	end

	x808060_g_SportsPrize_Active = 1
	return 1
end

--**********************************
--�о��¼�
--**********************************
function x808060_OnEnumerate( sceneId, selfId, targetId )
    x808060_CheckRightTime()
	  if 1 == x808060_g_SportsPrize_Active then
			AddNumText(sceneId, x808060_g_ScriptId, "��ȡ�������½���", 1, 1 )
    end
end

--**********************************
--������ں���
--**********************************
function x808060_OnDefaultEvent( sceneId, selfId, targetId )
	x808060_CheckRightTime()
	if 1 ~= x808060_g_SportsPrize_Active then
		return
	end

	local TextNum = GetNumText()

	if TextNum == 1 then
		x808060_SportsCard( sceneId, selfId, targetId )
	end
end
