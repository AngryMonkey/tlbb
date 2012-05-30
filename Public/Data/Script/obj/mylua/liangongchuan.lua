--����NPC
--��վ�ϰ�--������������QQ��274392181
--��ͨ

x210505_g_ScriptId	= 210505

--������Ϣ(�������ƣ�SceneID��PosX��PosY������ID)
x210505_g_mpInfo		= {}
x210505_g_mpInfo[0]	= { "����", 16,  96, 152, MP_XINGSU }
x210505_g_mpInfo[1]	= { "��ң", 14,  67, 145, MP_XIAOYAO }
x210505_g_mpInfo[2]	= { "����",  9,  96, 127, MP_SHAOLIN }
x210505_g_mpInfo[3]	= { "��ɽ", 17,  95, 120, MP_TIANSHAN }
x210505_g_mpInfo[4]	= { "����", 13,  96, 120, MP_DALI }
x210505_g_mpInfo[5]	= { "����", 15,  89, 139, MP_EMEI }
x210505_g_mpInfo[6]	= { "�䵱", 12, 103, 140, MP_WUDANG }
x210505_g_mpInfo[7]	= { "����", 11,  98, 167, MP_MINGJIAO }
x210505_g_mpInfo[8]	= { "ؤ��", 10,  91, 116, MP_GAIBANG }

x210505_g_Yinpiao = 40002000
--**********************************
--�¼��������
--**********************************
function x210505_OnDefaultEvent( sceneId, selfId, targetId )
	CallScriptFunction( (300053), "ChuanSong", sceneId, selfId, 400, 1 )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x210505_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction( (300053), "ChuanSong", sceneId, selfId, GetNumText(),1)
end

--**********************************
--��������ID��ȡ������Ϣ
--**********************************
function x210505_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x210505_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x210505_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x210505_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x210505_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
