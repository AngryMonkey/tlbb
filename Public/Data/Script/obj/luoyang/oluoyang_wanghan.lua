--����NPC
--����
--��ͨ

x000128_g_ScriptId	= 000128

--������Ϣ(�������ƣ�SceneID��PosX��PosY������ID)
x000128_g_mpInfo		= {}
x000128_g_mpInfo[0]	= { "����", 16,  96, 152, MP_XINGSU }
x000128_g_mpInfo[1]	= { "��ң", 14,  67, 145, MP_XIAOYAO }
x000128_g_mpInfo[2]	= { "����",  9,  96, 127, MP_SHAOLIN }
x000128_g_mpInfo[3]	= { "��ɽ", 17,  95, 120, MP_TIANSHAN }
x000128_g_mpInfo[4]	= { "����", 13,  96, 120, MP_DALI }
x000128_g_mpInfo[5]	= { "����", 15,  89, 139, MP_EMEI }
x000128_g_mpInfo[6]	= { "�䵱", 12, 103, 140, MP_WUDANG }
x000128_g_mpInfo[7]	= { "����", 11,  98, 167, MP_MINGJIAO }
x000128_g_mpInfo[8]	= { "ؤ��", 10,  91, 116, MP_GAIBANG }

x000128_g_Yinpiao = 40002000 

x000128_g_Impact_NotTransportList = { 5929, 5944 } -- ��ֹ���͵�Impact
x000128_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- ��ֹ���͵�Impact��ʾ��Ϣ

--**********************************
--�¼��������
--**********************************
function x000128_OnDefaultEvent( sceneId, selfId,targetId )
	
	-- �����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, x000128_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  ����������Ʊ���������̣��Ҳ��ܰ����㡣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	mp
	local	i		= 0
	BeginEvent( sceneId )
		AddText( sceneId, "#{XIYU_20071228_01}")
		AddNumText( sceneId, x000128_g_ScriptId, "��������", 9, 1000 )
		AddNumText( sceneId, x000128_g_ScriptId, "���� - ����", 9, 1001 )
		AddNumText( sceneId, x000128_g_ScriptId, "���� - ���� - ������", 9, 1007 )
		AddNumText( sceneId, x000128_g_ScriptId, "���� - ����", 9, 1002 )
		AddNumText( sceneId, x000128_g_ScriptId, "���� - ¥��", 9, 1011 )
		AddNumText( sceneId, x000128_g_ScriptId, "���� - ���ӹ���", 9, 1010 )
		AddNumText( sceneId, x000180_g_ScriptId, "#G������", 9, 1020 )
		AddNumText( sceneId, x000180_g_ScriptId, "#G�޸���", 9, 1021 )
		AddNumText( sceneId, x000180_g_ScriptId, "#G�����", 9, 1022 )
		--AddNumText( sceneId, x000128_g_ScriptId, "���� - ����", 9, 1006 )
		AddNumText( sceneId, x000128_g_ScriptId, "����ȥ��������", 9, 1012 )
		--for i, mp in x000128_g_mpInfo do
			--AddNumText( sceneId, x000128_g_ScriptId, "���� - "..mp[1], 9, i )
		--end

		
		
		-- ����������ȥ�ػͺ���ɽ
		AddNumText( sceneId, x000128_g_ScriptId, "����������ȥ�ػͺ���ɽ", 11, 2000 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000128_OnEventRequest( sceneId, selfId, targetId, eventId )
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
				x000128_MsgBox( sceneId, selfId, targetId, "  ������Ա�����������˻�������������վ����Ϊ���ṩ���ͷ���" )
				return
			end
		end
	end

	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x000128_MsgBox( sceneId, selfId, targetId, "  �������˻�������������վ����Ϊ���ṩ���ͷ���" )
		return
	end

	--���Impact״̬פ��Ч��
	for i, ImpactId in x000128_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x000128_MsgBox( sceneId, selfId, targetId, x000128_g_TalkInfo_NotTransportList[i] )			
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
			x000128_MsgBox( sceneId, selfId, targetId, "  �㻹û�м����κ����ɣ�" )
		else
			mp	= x000128_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			end
		end
		return
	end
	if arg == 1001 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 203,258 )
		return
	end
	if arg == 1007 then		--����������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 330, 224 )
		return
	end
	if arg == 1002 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 251, 123 )
		return
	end
	if arg == 1006 then		--����
		SetPos(sceneId, selfId, 132,183)
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
  	if arg == 1011 then		--¥��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 288, 136, 75 )
		return
	end
	for i, mp in x000128_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			return
		end
	end

	if GetNumText()== 1010 then		--���ӹ���
	-- modify by zchw
			-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x000128_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "���ӹ���Ϊ����ɱ����������ע�ⰲȫ����ȷ��Ҫ������");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	if arg == 1012 then		
		BeginEvent( sceneId )
			for i, mp in x000128_g_mpInfo do
				AddNumText( sceneId, x000128_g_ScriptId, "���� - "..mp[1], 9, i )
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
function x000128_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
--**********************************
--��������ID��ȡ������Ϣ
--**********************************
function x000128_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x000128_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x000128_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

