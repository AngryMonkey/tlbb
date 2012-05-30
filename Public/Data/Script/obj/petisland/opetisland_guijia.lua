--���䵺
--���
--��ͨ

x112001_g_ScriptId	= 112001

--������Ϣ(�������ƣ�SceneID��PosX��PosY������ID)
x112001_g_mpInfo		= {}
x112001_g_mpInfo[0]	= { "����", 16,  96, 152, MP_XINGSU }
x112001_g_mpInfo[1]	= { "��ң", 14,  67, 145, MP_XIAOYAO }
x112001_g_mpInfo[2]	= { "����",  9,  96, 127, MP_SHAOLIN }
x112001_g_mpInfo[3]	= { "��ɽ", 17,  95, 120, MP_TIANSHAN }
x112001_g_mpInfo[4]	= { "����", 13,  96, 120, MP_DALI }
x112001_g_mpInfo[5]	= { "����", 15,  89, 139, MP_EMEI }
x112001_g_mpInfo[6]	= { "�䵱", 12, 103, 140, MP_WUDANG }
x112001_g_mpInfo[7]	= { "����", 11,  98, 167, MP_MINGJIAO }
x112001_g_mpInfo[8]	= { "ؤ��", 10,  91, 116, MP_GAIBANG }

x112001_g_Yinpiao = 40002000 
--**********************************
--�¼��������
--**********************************
function x112001_OnDefaultEvent( sceneId, selfId,targetId )
	
	-- �����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, x112001_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  ����������Ʊ���������̣��Ҳ��ܰ����㡣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	mp
	local	i		= 0
	BeginEvent( sceneId )
		AddText( sceneId, "    ��ӭ�������䵺!")
		AddNumText( sceneId, x112001_g_ScriptId, "��������", 9, 1000 )
		AddNumText( sceneId, x112001_g_ScriptId, "���� - ����", 9, 1003 )
		AddNumText( sceneId, x112001_g_ScriptId, "���� - ����", 9, 1001 )
		AddNumText( sceneId, x112001_g_ScriptId, "���� - ����", 9, 1002 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x112001_OnEventRequest( sceneId, selfId, targetId, eventId )
	--�������
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				x112001_MsgBox( sceneId, selfId, targetId, "  ������Ա�����������˻�������������վ����Ϊ���ṩ���ͷ���" )
				return
			end
		end
	end

	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x112001_MsgBox( sceneId, selfId, targetId, "  �������˻�������������վ����Ϊ���ṩ���ͷ���" )
		return
	end

	--˳������
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--��������
		if id < 0 or id >= 9 then
			x112001_MsgBox( sceneId, selfId, targetId, "  �㻹û�м����κ����ɣ�" )
		else
			mp	= x112001_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			end
		end
		return
	end
	if arg == 1001 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 89,143 )
		return
	end
	if arg == 1002 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 263, 129 )
		return
	end
	if arg == 1003 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 183, 156 )
		return
	end
	for i, mp in x112001_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			return
		end
	end

	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
end

--**********************************
--��������ID��ȡ������Ϣ
--**********************************
function x112001_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x112001_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x112001_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
