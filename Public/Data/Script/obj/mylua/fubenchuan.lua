--����NPC
--��վ�ϰ�--������������QQ��274392181
--��ͨ

x210504_g_ScriptId	= 210504

--������Ϣ(�������ƣ�SceneID��PosX��PosY������ID)
x210504_g_mpInfo		= {}
x210504_g_mpInfo[0]	= { "����", 16,  96, 152, MP_XINGSU }
x210504_g_mpInfo[1]	= { "��ң", 14,  67, 145, MP_XIAOYAO }
x210504_g_mpInfo[2]	= { "����",  9,  96, 127, MP_SHAOLIN }
x210504_g_mpInfo[3]	= { "��ɽ", 17,  95, 120, MP_TIANSHAN }
x210504_g_mpInfo[4]	= { "����", 13,  96, 120, MP_DALI }
x210504_g_mpInfo[5]	= { "����", 15,  89, 139, MP_EMEI }
x210504_g_mpInfo[6]	= { "�䵱", 12, 103, 140, MP_WUDANG }
x210504_g_mpInfo[7]	= { "����", 11,  98, 167, MP_MINGJIAO }
x210504_g_mpInfo[8]	= { "ؤ��", 10,  91, 116, MP_GAIBANG }

x210504_g_Yinpiao = 40002000
--**********************************
--�¼��������
--**********************************
function x210504_OnDefaultEvent( sceneId, selfId, targetId )
	CallScriptFunction( (300053), "ChuanSong", sceneId, selfId, 406, 1 )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x210504_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction( (300053), "ChuanSong", sceneId, selfId, GetNumText(),1)
end

--**********************************
--��������ID��ȡ������Ϣ
--**********************************
function x210504_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x210504_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x210504_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
