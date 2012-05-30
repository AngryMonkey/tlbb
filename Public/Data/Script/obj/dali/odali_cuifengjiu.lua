--����NPC
--�޷��
--��ͨ

x002026_g_ScriptId	= 002026

--������Ϣ(�������ƣ�SceneID��PosX��PosY������ID)
x002026_g_mpInfo		= {}
x002026_g_mpInfo[0]	= { "����", 16,  96, 152, MP_XINGSU }
x002026_g_mpInfo[1]	= { "��ң", 14,  67, 145, MP_XIAOYAO }
x002026_g_mpInfo[2]	= { "����",  9,  96, 127, MP_SHAOLIN }
x002026_g_mpInfo[3]	= { "��ɽ", 17,  95, 120, MP_TIANSHAN }
x002026_g_mpInfo[4]	= { "����", 13,  96, 120, MP_DALI }
x002026_g_mpInfo[5]	= { "����", 15,  89, 139, MP_EMEI }
x002026_g_mpInfo[6]	= { "�䵱", 12, 103, 140, MP_WUDANG }
x002026_g_mpInfo[7]	= { "����", 11,  98, 167, MP_MINGJIAO }
x002026_g_mpInfo[8]	= { "ؤ��", 10,  91, 116, MP_GAIBANG }

x002026_g_Yinpiao = 40002000

x002026_g_Impact_NotTransportList = { 5929, 5944 } -- ��ֹ���͵�Impact
x002026_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- ��ֹ���͵�Impact��ʾ��Ϣ

--**********************************
--�¼��������
--**********************************
function x002026_OnDefaultEvent( sceneId, selfId, targetId )

	-- �����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, x002026_g_Yinpiao)>=1  then
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
			AddText( sceneId, "#{XIYU_20071228_01}" )
			AddNumText( sceneId, x002026_g_ScriptId, "��������", 9, 1000 )
			AddNumText( sceneId, x002026_g_ScriptId, "���� - ����", 9, 1001 )
			AddNumText( sceneId, x002026_g_ScriptId, "���� - ����", 9, 1002 )
			AddNumText( sceneId, x002026_g_ScriptId, "���� - ���� - �����̻�", 9, 1006 )
			AddNumText( sceneId, x002026_g_ScriptId, "���� - ���� - ������", 9, 1007 )
			if GetLevel( sceneId, selfId ) >= 75 then
				AddNumText( sceneId, x002026_g_ScriptId, "���� - ¥��", 9, 1011 )
			end
			AddNumText( sceneId, x002026_g_ScriptId, "���� - ���ӹ���", 9, 1010 )
			AddNumText( sceneId, x002026_g_ScriptId, "#G���� - ��˹���", 9, 1014 )
			--AddNumText( sceneId, x002026_g_ScriptId, "#G����ͯ�� - ���ظ���", 9, 1013 )		
			--AddNumText( sceneId, x002026_g_ScriptId, "#G�������� - ʥ��", 9, 1015 )
			AddNumText( sceneId, x000180_g_ScriptId, "#G������", 9, 1020 )
			AddNumText( sceneId, x000180_g_ScriptId, "#G�޸���", 9, 1021 )
			AddNumText( sceneId, x000180_g_ScriptId, "#G�����", 9, 1022 )	
			AddNumText( sceneId, x002026_g_ScriptId, "����ȥ��������", 9, 1012 )

			--for i, mp in x002026_g_mpInfo do
			--	AddNumText( sceneId, x002026_g_ScriptId, "���� - "..mp[1], 9, i )
			--end
		else
			AddText( sceneId, "  ����Ҫ�ȼ�����10�����ϣ�����ȥ��ĳ��С�" )
			AddNumText( sceneId, x002026_g_ScriptId, "���� - ����",  9, 1003 )
			AddNumText( sceneId, x002026_g_ScriptId, "���� - ����2", 9, 1004 )
			AddNumText( sceneId, x002026_g_ScriptId, "���� - ����3", 9, 1005 )
		end
		
		
		
		-- ����������ȥ�ػͺ���ɽ
		AddNumText( sceneId, x002026_g_ScriptId, "����������ȥ�ػͺ���ɽ", 11, 2000 )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--���ͼ�飬����͵ȼ���Ҵ��ߵȼ���ҵ�����2��3������
--**********************************
function x002026_EnterConditionCheck(sceneId, selfId)
	local teamSize = GetNearTeamCount(sceneId, selfId); 
	if teamSize > 1 then
		for i=0, teamSize-1 do
	  	local objId = GetNearTeamMember(sceneId, selfId, i);
	  	if GetLevel(sceneId, objId) > 9 and IsTeamFollow(sceneId, objId) == 1 then
	  		local name = GetName(sceneId, objId);
	  		local msg = format("  ��Ա%s�ȼ����ߣ����ܽ��룡", name);
	  		return 0, msg;
	  	end  	
	  end
  end
	return 1, "ok";
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002026_OnEventRequest( sceneId, selfId, targetId, eventId )
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
				x002026_MsgBox( sceneId, selfId, targetId, "  ������Ա�����������˻�������������վ����Ϊ���ṩ���ͷ���" )
				return
			end
		end
	end

	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x002026_MsgBox( sceneId, selfId, targetId, "  �������˻�������������վ����Ϊ���ṩ���ͷ���" )
		return
	end
	
	--���Impact״̬פ��Ч��
	for i, ImpactId in x002026_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x002026_MsgBox( sceneId, selfId, targetId, x002026_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end
	
	--˳������
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--��������
		if id < 0 or id >= 9 then
			x002026_MsgBox( sceneId, selfId, targetId, "  �㻹û�м����κ����ɣ�" )
		else
			mp	= x002026_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			end
		end
		return
	end
	if arg == 1001 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 229, 322, 10 )
		return
	end
	if arg == 1002 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 203,258, 10 )
		return
	end
	if arg == 1006 then		--�����̻�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 330, 272, 10 )
		return
	end
	if arg == 1007 then		--����������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 330, 224, 10 )
		return
	end
	if arg == 1020 then		--������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 562, 195, 192, 10 )
		return
	end
	if arg == 1021 then		--�޸���
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 561, 80, 200, 10 )
		return
	end
	if arg == 1022 then		--�����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 560, 56, 74, 10 )
		return
	end

	if arg == 1003 then		--����1
		--�����Ҿ��ڴ���1�򲻴���
		if sceneId == 2 then
			x002026_MsgBox( sceneId, selfId, targetId, "  ���Ѿ��ڴ����ˡ�" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 375, 227 )
		end
		return
	end
	if arg == 1004 then		--����2
		--�����Ҿ��ڴ���2�򲻴���
		if sceneId == 71 then
			x002026_MsgBox( sceneId, selfId, targetId, "  ���Ѿ��ڴ���2�ˡ�" )
		else
			local ret, msg = x002026_EnterConditionCheck(sceneId, selfId);
			if ret == 0 then
				x002026_MsgBox(sceneId, selfId, targetId, msg);
				return
			end
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 375, 227 )
		end
		return
	end
	if arg == 1005 then		--����3
		--�����Ҿ��ڴ���3�򲻴���
		if sceneId == 72 then
			x002026_MsgBox( sceneId, selfId, targetId, "  ���Ѿ��ڴ���3�ˡ�" )
		else
			local ret, msg = x002026_EnterConditionCheck(sceneId, selfId);
			if ret == 0 then
				x002026_MsgBox(sceneId, selfId, targetId, msg);
				return
			end
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 375, 227 )
		end
		return
	end
	for i, mp in x002026_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			return
		end
	end
	
	if arg == 1010 then		--���ӹ���
		-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x002026_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "���ӹ���Ϊ����ɱ����������ע�ⰲȫ����ȷ��Ҫ������");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	if arg == 1011 then		--¥��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 288, 136, 75 )
		return
	end
	if arg == 1014 then		--��˹���
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 180, 49, 32, 75 )
		return
	end
	if arg == 1013 then		--���ظ���
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 421, 89, 41, 75 )
		return
	end
	if arg == 1015 then		--ʥ��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 537, 89, 41, 75 )
		return
	end


	if arg == 1012 then		
		BeginEvent( sceneId )
			for i, mp in x002026_g_mpInfo do
				AddNumText( sceneId, x002026_g_ScriptId, "���� - "..mp[1], 9, i )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
		return
	end


	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
	
end
--  add by zchw
function x002026_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
--**********************************
--��������ID��ȡ������Ϣ
--**********************************
function x002026_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x002026_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x002026_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
