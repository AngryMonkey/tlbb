--��ͼ���͵�NPC
--����
--����С������

x002943_g_ScriptId	= 002943
x002943_g_Yinpiao = 40002000
--**********************************
--�¼��������
--**********************************
function x002943_OnDefaultEvent( sceneId, selfId, targetId )

	-- �����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, x002943_g_Yinpiao)>=1  then
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
			AddText( sceneId, "#W�ĸ������Ѿ������Ǵ���ˣ�СŮ�ӶԸ�λ�Ĵ���������Ϊ����" )
			AddNumText( sceneId, x002943_g_ScriptId, "#G�뿪�ľ�ׯ", 9, 101 )
			--AddNumText( sceneId, x002943_g_ScriptId, "#G�������ľ���", 9, 200 )
			--AddNumText( sceneId, x002943_g_ScriptId, "����", 9, 300 )
			--AddNumText( sceneId, x002943_g_ScriptId, "¥��", 9, 400 )
			--AddNumText( sceneId, x002943_g_ScriptId, "�Ϻ�", 9, 500 )
			--AddNumText( sceneId, x002943_g_ScriptId, "��گ", 9, 600 )
			--AddNumText( sceneId, x002943_g_ScriptId, "����ɽ", 9, 700 )
						for i, mp in x002026_g_mpInfo do
			end
		else
			AddText( sceneId, "  ����Ҫ�ȼ�����10�����ϣ�����ȥ��ĳ��С�" )
			AddNumText( sceneId, x002943_g_ScriptId, "���� - ����",  9, 1003 )
			AddNumText( sceneId, x002943_g_ScriptId, "���� - ����2", 9, 1004 )
			AddNumText( sceneId, x002943_g_ScriptId, "���� - ����3", 9, 1005 )
		end


	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002943_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 100 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����ȷ��������?" )
			AddNumText( sceneId, x002943_g_scriptId, "ȷ��", -1, 101)
			AddNumText( sceneId, x002943_g_scriptId, "ȡ��", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 101 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 100, 122, 10 )
	end

	if GetNumText() == 200 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 540, 96, 81, 10 )
	end

	if GetNumText() == 300 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����ȷ��������?" )
			AddNumText( sceneId, x002943_g_scriptId, "ȷ��", -1, 301)
			AddNumText( sceneId, x002943_g_scriptId, "ȡ��", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 301 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �Բ������Ľ�Ǯ���㣡�޷�����" )
		AddNumText( sceneId, x002943_g_scriptId, "ȡ��", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 246, 106, 10 )
	end

	if GetNumText() == 400 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����ȷ��������?" )
			AddNumText( sceneId, x002943_g_scriptId, "ȷ��", -1, 401)
			AddNumText( sceneId, x002943_g_scriptId, "ȡ��", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 401 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �Բ������Ľ�Ǯ���㣡�޷�����" )
		AddNumText( sceneId, x002943_g_scriptId, "ȡ��", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 184, 294, 90, 10 )
	end

	if GetNumText() == 500 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����ȷ��������?" )
			AddNumText( sceneId, x002943_g_scriptId, "ȷ��", -1, 501)
			AddNumText( sceneId, x002943_g_scriptId, "ȡ��", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 501 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �Բ������Ľ�Ǯ���㣡�޷�����" )
		AddNumText( sceneId, x002943_g_scriptId, "ȡ��", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 34, 206, 266, 10 )
	end

	if GetNumText() == 600 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����ȷ��������?" )
			AddNumText( sceneId, x002943_g_scriptId, "ȷ��", -1, 601)
			AddNumText( sceneId, x002943_g_scriptId, "ȡ��", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 601 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �Բ������Ľ�Ǯ���㣡�޷�����" )
		AddNumText( sceneId, x002943_g_scriptId, "ȡ��", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 28, 186, 43, 10 )
	end

	if GetNumText() == 700 then
		BeginEvent( sceneId )
					AddText( sceneId, "���δ��ͽ�������50����ȷ��������?" )
			AddNumText( sceneId, x002943_g_scriptId, "ȷ��", -1, 701)
			AddNumText( sceneId, x002943_g_scriptId, "ȡ��", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 701 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �Բ������Ľ�Ǯ���㣡�޷�����" )
		AddNumText( sceneId, x002943_g_scriptId, "ȡ��", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 22, 158, 113, 10 )
	end

	if GetNumText() == 4   then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
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
				x002943_MsgBox( sceneId, selfId, targetId, "  ������Ա������������\��������������վ����Ϊ���ṩ���ͷ���" )
				return
			end
		end
	end

	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x002943_MsgBox( sceneId, selfId, targetId, "  ��������\��������������վ����Ϊ���ṩ���ͷ���" )
		return
	end

	--˳������
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--��������
		if id < 0 or id >= 9 then
			x002943_MsgBox( sceneId, selfId, targetId, "  �㻹û�м����κ����ɣ�" )
		else
			mp	= x002943_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			end
		end
		return
	end
	if arg == 1001 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 132, 183, 10 )
		return
	end
	if arg == 1002 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 114,162, 10 )
		return
	end
	if arg == 1006 then		--�����̻�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 234, 132, 10 )
		return
	end
	if arg == 1003 then		--����1
		--�����Ҿ��ڴ���1�򲻴���
		if sceneId == 2 then
			x002943_MsgBox( sceneId, selfId, targetId, "  ���Ѿ��ڴ����ˡ�" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 138 )
		end
		return
	end
	if arg == 1004 then		--����2
		--�����Ҿ��ڴ���2�򲻴���
		if sceneId == 71 then
			x002943_MsgBox( sceneId, selfId, targetId, "  ���Ѿ��ڴ���2�ˡ�" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 71, 241, 138 )
		end
		return
	end
	if arg == 1005 then		--����3
		--�����Ҿ��ڴ���3�򲻴���
		if sceneId == 72 then
			x002943_MsgBox( sceneId, selfId, targetId, "  ���Ѿ��ڴ���3�ˡ�" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 72, 241, 138 )
		end
		return
	end
	for i, mp in x002943_g_mpInfo do
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
function x002943_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x002943_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x002943_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
