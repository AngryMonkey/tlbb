--����NPC
--��վ�ϰ�
--��ͨ

x002958_g_ScriptId	= 002958

--������Ϣ(�������ƣ�SceneID��PosX��PosY������ID)
x002958_g_mpInfo		= {}
x002958_g_mpInfo[0]	= { "����", 16,  96, 152, MP_XINGSU }
x002958_g_mpInfo[1]	= { "��ң", 14,  67, 145, MP_XIAOYAO }
x002958_g_mpInfo[2]	= { "����",  9,  96, 127, MP_SHAOLIN }
x002958_g_mpInfo[3]	= { "��ɽ", 17,  95, 120, MP_TIANSHAN }
x002958_g_mpInfo[4]	= { "����", 13,  96, 120, MP_DALI }
x002958_g_mpInfo[5]	= { "����", 15,  89, 139, MP_EMEI }
x002958_g_mpInfo[6]	= { "�䵱", 12, 103, 140, MP_WUDANG }
x002958_g_mpInfo[7]	= { "����", 11,  98, 167, MP_MINGJIAO }
x002958_g_mpInfo[8]	= { "ؤ��", 10,  91, 116, MP_GAIBANG }

x002958_g_Yinpiao = 40002000
--**********************************
--�¼��������
--**********************************
function x002958_OnDefaultEvent( sceneId, selfId, targetId )

	-- �����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, x002958_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  ����������Ʊ���������̣��Ҳ��ܰ����㡣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	mp
	local	i		= 0
	BeginEvent( sceneId )
		if GetLevel( sceneId, selfId ) >= 10 then
			AddText( sceneId, "#b#G�����˲�3����" )
			--AddNumText( sceneId, x002958_g_ScriptId, "#gFF83FA��������", 9, 1000 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFF7F24���������", 9, 1001 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFF7F24�ܾ���һ�ų���", 9, 1002 )
			AddNumText( sceneId, x002958_g_ScriptId, "#cFF0000�ֺ�Ϫ��", 9, 1003 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFAFAFA��������", 9, 1006 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFAFAFA�޸�����", 9, 1007 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFAFAFA��������", 9, 1008 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFAFAFA�����", 9, 1012 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFAFAFA�޸���", 9, 1013 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFAFAFA������", 9, 1014 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFF7F24Į����ԭ", 9, 1015 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFF7F24��������", 9, 1016 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFF7F24����ϻ�", 9, 1017 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFF7F24������", 9, 1018 )
			--AddNumText( sceneId, x002958_g_ScriptId, "#gFAFAFAҰ�� - ��˹�������ר����", 9, 1019 )
			--AddNumText( sceneId, x002958_g_ScriptId, "#gFAFAFAҰ�� - ���ӹ���BOSSר����", 9, 1009 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFAFAFAҰ�� - ���ظ��أ�BOSSר����", 9, 1010 )
			AddNumText( sceneId, x002958_g_ScriptId, "#gFFB6C1����ȥ��������", 9, 1011 )
			for i, mp in x002958_g_mpInfo do
				--AddNumText( sceneId, x002958_g_ScriptId, "���� - "..mp[1], 9, i )
			end
		else
			AddText( sceneId, "  ����Ҫ�ȼ�����10�����ϣ�����ȥ��ĳ��С�" )
			AddNumText( sceneId, x002958_g_ScriptId, "���� - ����",  9, 1003 )
			AddNumText( sceneId, x002958_g_ScriptId, "���� - ����2", 9, 1004 )
			AddNumText( sceneId, x002958_g_ScriptId, "���� - ����3", 9, 1005 )
		end

		-- ����������ȥ�ػͺ���ɽ
		--AddNumText( sceneId, x002958_g_ScriptId, "����������ȥ�ػͺ���ɽ", 11, 2000 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002958_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1011 then
	local	mp
	local	i		= 0
		BeginEvent( sceneId )
			for i, mp in x002958_g_mpInfo do
				AddNumText( sceneId, x002958_g_ScriptId, "���� - "..mp[1], 9, i )
			end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
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
				x002958_MsgBox( sceneId, selfId, targetId, "  ������Ա������������\��������������վ����Ϊ���ṩ���ͷ���" )
				return
			end
		end
	end

	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x002958_MsgBox( sceneId, selfId, targetId, "  ��������\��������������վ����Ϊ���ṩ���ͷ���" )
		return
	end

	--˳������
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--��������
		if id < 0 or id >= 9 then
			x002958_MsgBox( sceneId, selfId, targetId, "  �㻹û�м����κ����ɣ�" )
		else
			mp	= x002958_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			end
		end
		return
	end
	if arg == 1001 then		--���������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 550, 250, 250, 10 )
		return
	end
	if arg == 1002 then		--�ܾ���һ�ų���
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 551, 48,48, 10 )
		return
	end
	if arg == 1003 then		--�ֺ�Ϫ��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 552, 100,100, 10 )
		return
	end
	if arg == 1006 then		--��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 553, 48, 48, 10 )
		return
	end
	if arg == 1007 then		--�޸�����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 554, 48, 48, 10 )
		return
	end
	if arg == 1008 then		--��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 555, 48, 48, 10 )
		return
	end
	if arg == 1009 then		--���ӹ���
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 422, 200, 211, 10 )
		return
	end
	if arg == 1010 then		--���ظ���
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 421, 93, 36, 10 )
		return
	end
	if arg == 1012 then		--�����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 560, 110, 110, 10 )
		return
	end
	if arg == 1013 then		--�޸���
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 561, 125, 139, 10 )
		return
	end
	if arg == 1014 then		--������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 562, 125, 134, 10 )
		return
	end
	if arg == 1015 then		--Į����ԭ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 556, 125, 134, 10 )
		return
	end
	if arg == 1016 then		--��������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 557, 125, 134, 10 )
		return
	end
	if arg == 1017 then		--����ϻ�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 558, 125, 134, 10 )
		return
	end
	if arg == 1018 then		--������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 559, 185, 185, 10 )
		return
	end
	if arg == 1019 then		--��˹ų�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 180, 53, 36, 10 )
		return
	end
	if arg == 1003 then		--����1
		--�����Ҿ��ڴ���1�򲻴���
		if sceneId == 2 then
			x002958_MsgBox( sceneId, selfId, targetId, "  ���Ѿ��ڴ����ˡ�" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 138 )
		end
		return
	end
	if arg == 1004 then		--����2
		--�����Ҿ��ڴ���2�򲻴���
		if sceneId == 71 then
			x002958_MsgBox( sceneId, selfId, targetId, "  ���Ѿ��ڴ���2�ˡ�" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 71, 241, 138 )
		end
		return
	end
	if arg == 1005 then		--����3
		--�����Ҿ��ڴ���3�򲻴���
		if sceneId == 72 then
			x002958_MsgBox( sceneId, selfId, targetId, "  ���Ѿ��ڴ���3�ˡ�" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 72, 241, 138 )
		end
		return
	end
	for i, mp in x002958_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
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
function x002958_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x002958_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x002958_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
