--*********************************************************************

-- Author	: liudun
-- Desc		: ͨ�ó齱���̣�ͳһ���ݣ����ۣ������ǳ齱����
-- ScriptID	: 808078
-- Date		: 2008/03/15

--*********************************************************************

x808078_g_ScriptId						= 808078
x808078_g_CommonPrize_Active			= 0			--Ĭ�Ϲر�

x808078_g_ActiveStartTime				= 7168	--20070618
--x808078_g_ActiveEndTime				= 7198	--20070718

function x808078_CommonCard(sceneId,selfId,targetId)	
	--�����뿨�Ž���
	--if GetLevel(sceneId, selfId) > 30 then
		--BeginEvent(sceneId)
			--AddText(sceneId, "���ĵȼ����ߣ��޷�����Ƹ�����")
		--EndEvent()
		--DispatchEventList( sceneId, selfId, targetId )
		--return 
	--end
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 2006 )		
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x808078_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--���ʱ��
--**********************************
--function x808078_CheckRightTime()
--	local DayTime = GetDayTime()
--	PrintNum(DayTime)
--	if DayTime < x808078_g_ActiveStartTime then
--		x808078_g_CommonPrize_Active = 0
--		return 0    --��ǰ�ǻʱ��
--	end

--	if DayTime > x808078_g_ActiveEndTime then
--		x808078_g_CommonPrize_Active = 0
--		return 0    --�˺��Ѿ�����
--	end

--	x808078_g_CommonPrize_Active = 1
--	return 1
--	end

--**********************************
--�о��¼�
--**********************************
function x808078_OnEnumerate( sceneId, selfId, targetId )
    --x808078_CheckRightTime()
	AddNumText(sceneId, x808078_g_ScriptId, "��ȡ������Ʒ������", 1, 1 )
end

--**********************************
--������ں���
--**********************************
function x808078_OnDefaultEvent( sceneId, selfId, targetId )
	local TextNum = GetNumText()
	if TextNum == 1 then
		x808078_CommonCard( sceneId, selfId, targetId )
	end
end
