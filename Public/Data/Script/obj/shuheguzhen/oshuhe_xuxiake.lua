--���ӹ���NPC
--��ϼ��
--��ͨ

x001171_g_ScriptId	= 001171

x001171_g_Yinpiao = 40002000

x001171_g_Impact_NotTransportList = { 5929, 5944 } -- ��ֹ���͵�Impact
x001171_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- ��ֹ���͵�Impact��ʾ��Ϣ

--������Ϣ(�������ƣ�SceneID��PosX��PosY������ID)
x001171_g_mpInfo		= {}
x001171_g_mpInfo[0]	= { "����", 16,  96, 152, MP_XINGSU }
x001171_g_mpInfo[1]	= { "��ң", 14,  67, 145, MP_XIAOYAO }
x001171_g_mpInfo[2]	= { "����",  9,  96, 127, MP_SHAOLIN }
x001171_g_mpInfo[3]	= { "��ɽ", 17,  95, 120, MP_TIANSHAN }
x001171_g_mpInfo[4]	= { "����", 13,  96, 120, MP_DALI }
x001171_g_mpInfo[5]	= { "����", 15,  89, 139, MP_EMEI }
x001171_g_mpInfo[6]	= { "�䵱", 12, 103, 140, MP_WUDANG }
x001171_g_mpInfo[7]	= { "����", 11,  98, 167, MP_MINGJIAO }
x001171_g_mpInfo[8]	= { "ؤ��", 10,  91, 116, MP_GAIBANG }

x001171_g_MsgInfo = { "#{SHGZ_001}",
											"#{SHGZ_0620_01}",
											"#{SHGZ_0620_02}",
											"#{SHGZ_0620_03}",
										}

--**********************************
--�¼��������
--**********************************
function x001171_OnDefaultEvent( sceneId, selfId, targetId )

	-- �����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, x001171_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  ����������Ʊ���������̣��Ҳ��ܰ����㡣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	BeginEvent( sceneId )
	
		local msgidx = random(getn(x001171_g_MsgInfo))
		AddText( sceneId, x001171_g_MsgInfo[msgidx] )
		AddNumText( sceneId, x001171_g_ScriptId, "��������", 9, 1000 )
		AddNumText( sceneId, x001171_g_ScriptId, "���� - ����", 9, 1001 )
		AddNumText( sceneId, x001171_g_ScriptId, "���� - ����", 9, 1002 )
		AddNumText( sceneId, x001171_g_ScriptId, "���� - ����", 9, 1003 )
		AddNumText( sceneId, x001171_g_ScriptId, "���� - ���� - �����̻�", 9, 1006 )
		AddNumText( sceneId, x001171_g_ScriptId, "���� - ���� - ������", 9, 1007 )
		AddNumText( sceneId, x001171_g_ScriptId, "���� - ¥��", 9, 1008 )
		
		AddNumText( sceneId, x001171_g_ScriptId, "����ȥ��������", 9, 1011 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001171_OnEventRequest( sceneId, selfId, targetId, eventId )
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
				x001171_MsgBox( sceneId, selfId, targetId, "  ������Ա�����������˻�������������վ����Ϊ���ṩ���ͷ���" )
				return
			end
		end
	end

	--�������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x001171_MsgBox( sceneId, selfId, targetId, "  �������˻�������������վ����Ϊ���ṩ���ͷ���" )
		return
	end
	
	--���Impact״̬פ��Ч��
	for i, ImpactId in x001171_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x001171_MsgBox( sceneId, selfId, targetId, x001171_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end
	
	--˳������
	local	arg	= GetNumText()

	local	mp
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--��������
		if id < 0 or id >= 9 then
			x001171_MsgBox( sceneId, selfId, targetId, "  �㻹û�м����κ����ɣ�" )
		else
			mp	= x001171_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			end
		end
		return
	end
	
	if arg == 1001 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 229, 322, 20 )
		return
	end
	if arg == 1002 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 203, 258, 20 )
		return
	end
	
	if arg == 1003 then		--����
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 375, 227, 20 )
		return
	end
	
	if arg == 1006 then		--�����̻�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 330, 272, 20 )
		return
	end
	if arg == 1007 then		--����������
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 330, 224, 20 )
		return
	end
	
	if arg == 1008 then		--¥��
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 288, 136, 75 )
		return
	end

	if arg == 1011 then		
		BeginEvent( sceneId )
			for i, mp in x001171_g_mpInfo do
				AddNumText( sceneId, x001171_g_ScriptId, "���� - "..mp[1], 9, i )
			end
			
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
		return
	end
	
	
	--����....
	for i, mp in x001171_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			return
		end
	end
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x001171_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
--��������ID��ȡ������Ϣ
--**********************************
function x001171_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x001171_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end
