-- �������

--�ű���
x806001_g_ScriptId = 806001

--�����Ҫ�Ľ�Ǯ
x806001_g_NeedMoney = 100000
x806001_g_DrawTitleNeedMoney = 50000
x806001_g_ChangeTitleNeedMoney = 10000

--��ʾ��Ϣ
x806001_g_msg_swear					= {}
x806001_g_msg_swear["swr"]	= "���"
x806001_g_msg_swear["tit"]	= "��ȡ�ƺ�"
x806001_g_msg_swear["chr"]	= "�޸ĸ��˳ƺ�"
x806001_g_msg_swear["tem"]	= " ����Ҫ����Ҫ���֮�����ǰ�����ң��Ҳ��ܸ��������ֽ����ʽ��"
x806001_g_msg_swear["ten"]	= " ��Ķ��������˲����������У��������޷�Ϊ�������ֽ����ʽ��"
x806001_g_msg_swear["cap"]	= " ֻ�жӳ�������ɽ�ݵĲ�����"
x806001_g_msg_swear["mar"]	= " ����֮���ǲ��ܽ�ݵġ����ǻ����Ȼ�ȥ�ɡ�"
x806001_g_msg_swear["mat"]	= " ʦͽ֮���ǲ��ܽ�ݵġ����ǻ����Ȼ�ȥ�ɡ�"
x806001_g_msg_swear["fri"]	= " ֻ�к���֮����ܽ�ݡ����ǻ���Ҫ��һ�����������С�"
x806001_g_msg_swear["all"]	= " ���еĽ���ֵܱ���ͬʱ�ڶ����У����ܼ����µĽ���ֵܡ�"
x806001_g_msg_swear["one"]	= " �����Ѿ��ǽ���ֵ��ˣ�����Ҫ�ٽ��һ�������������ˡ�"
x806001_g_msg_swear["alr"]	= " ���Ķ�����A�Ѿ���ݹ����������޷�Ϊ���ǽ�ݡ�"
x806001_g_msg_swear["frd"]	= " ����������ݵĻ����ҿ���Ϊ�������ֽ����ʽ��׫д�����ס���������֮ǰ��Ҫȷ������֮����Ѻö��Ѿ��ﵽ1000�㡣"
x806001_g_msg_swear["mon"]	= " ���н����ʽ��Ҫ����#{_EXCHG%d}����ȷ��Ҫ�����"
x806001_g_msg_swear["nom"]	= " �����ϵ��ֽ���#{_EXCHG%d}��"
x806001_g_msg_swear["con"]	= " �ֵܽ�ݣ�����и�ͬ������ͬ���������ȷ��Ҫ�����"
x806001_g_msg_swear["chn"]	= " ��Ķ��鷢���˱仯���������޷�Ϊ�������ֽ����ʽ��"
x806001_g_msg_swear["bul"]	= " �������ϣ��������£����ǽ��ս��Ϊ�ֵܣ��Ժ��и�ͬ������ͬ��������ͬ��ͬ��ͬ����������ͬ��ͬ��ͬ����������Ӣ���ǣ�ף�����ǰɣ�"
x806001_g_msg_swear["pro"]	= " ��ϲ��λ�������Ѿ���Ϊ����ֵܣ������ǵĶӳ�����ȡ��ݳƺŰɡ�"
x806001_g_msg_swear["caa"]	= " �����������н���ֵ���ӣ�������ȡ��ݳƺš�"
x806001_g_msg_swear["cac"]	= " ֻ�жӳ�����Ϊ����ֵ�����ȡ�ƺš�"
x806001_g_msg_swear["cas"]	= " �㻹û�н�ݹ���������ȡ��ݳƺš�"
x806001_g_msg_swear["cab"]	= " ��Ķ��������˲�����Ľ���ֵܡ�"
x806001_g_msg_swear["cat"]	= " ���Ѿ���ȡ����ݳƺ��ˡ�"
x806001_g_msg_swear["can"]	= " �㻹û����ȡ����ݳƺţ��������޸Ľ�ݳƺš�"
x806001_g_msg_swear["ccs"]	= " �㻹û�н�ݹ��������޸Ľ�ݳƺš�"
x806001_g_msg_swear["nmm"]	= " �޸Ľ�ݳƺ���Ҫ#{_EXCHG%d}�������ϵ��ֽ��㡣"
x806001_g_msg_swear["ner"]	= " �������̫Զ�ˣ����޷�Ϊ�������ֽ����ʽ��"
x806001_g_msg_swear["nel"]	= " ��Ķ������ڽ�ݣ����������̫Զ�����޷�Ϊ�������ֽ����ʽ��"
x806001_g_msg_swear["wait"]	= " �ȴ������˻ظ���"

--Key for AddNumText
x806001_g_key					= {}
x806001_g_key["swear"]	= 10000	--�������
x806001_g_key["allow"]	= 10001	--ȷ����ݻ��ѽ���
x806001_g_key["unall"]	= 10002	--ȡ����ݻ��ѽ���
x806001_g_key["confi"]	= 10003	--ȷ�����ͬ�����
x806001_g_key["uncon"]	= 10004	--ȡ�����ͬ�����
x806001_g_key["title"]	= 20000	--��ȡ�ƺ�
x806001_g_key["chrti"]	= 30000	--�޸ĳƺ�

--**********************************
--������ں���
--**********************************
function x806001_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	
	-- ����Ƿ��������
	if key == x806001_g_key["swear"] then
		if x806001_CheckAccept( sceneId, selfId, targetId ) == 0 then
			return 0
		end
		x806001_LogTeamInfo( sceneId, selfId, targetId )
		x806001_OnSubmit( sceneId, selfId, targetId )
		return 1
	end
	
	--ȷ�ϻ���
	if key == x806001_g_key["allow"] then
		--local money
		--money = LuaFnGetMoney( sceneId, selfId )
		--hzp 2008-12-9
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
		if nMoneySelf < x806001_g_NeedMoney then	
			local msg	= format( x806001_g_msg_swear["nom"], x806001_g_NeedMoney )
			x806001_MessageBox( sceneId, selfId, targetId, msg )
			return 0
		end
		x806001_OnConfirm( sceneId, selfId, targetId )
		return 1
	end
	
	--ȡ������
	if key == x806001_g_key["unall"] then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
	
	--ͬ����
	if key == x806001_g_key["confi"] then
		--��¼��Ϣ
		x806001_AgreeSwear( sceneId, selfId, targetId )
		
		--�رմ���
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		
		--�鿴�Ƿ����еĶ�Ա��ͬ����
		if x806001_CheckIfAllAgreeSwear( sceneId, selfId, targetId ) == 1 then
			x806001_DoSwear( sceneId, selfId, targetId )
		else
			x806001_WaitSwear( sceneId, selfId, targetId )
		end
		return 1
	end

	--��ͬ����
	if key == x806001_g_key["uncon"] then
		x806001_QuitSwear( sceneId, selfId, targetId )
		return 1
	end
	
	--��ȡ�ƺ�
	if key == x806001_g_key["title"] then
		local TeamSize = x806001_CheckDrawTitle( sceneId, selfId, targetId )
		if TeamSize == 0 then
			return 0
		end
		
		--��¼������Ϣ
		x806001_LogTeamInfo( sceneId, selfId, targetId )
		
		--��ȡ��ݳƺ�
		LuaFnDrawJieBaiName( sceneId, selfId, TeamSize )
		return 1
	end
	
	--�޸ĸ��˳ƺ�
	if key == x806001_g_key["chrti"] then
		if x806001_CheckChangeTitle( sceneId, selfId, targetId ) == 0 then
			return 0
		end
		
		--�޸Ľ�ݳƺ�
		LuaFnChangeJieBaiName( sceneId, selfId, TeamSize )
		return 1
	end

	return 0
end

--**********************************
--�о��¼�
--**********************************
function x806001_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x806001_g_ScriptId, x806001_g_msg_swear["swr"], 6, x806001_g_key["swear"] )
	AddNumText( sceneId, x806001_g_ScriptId, x806001_g_msg_swear["tit"], 6, x806001_g_key["title"] )
	AddNumText( sceneId, x806001_g_ScriptId, x806001_g_msg_swear["chr"], 6, x806001_g_key["chrti"] )
end

--**********************************
--����������
--**********************************
function x806001_CheckAccept( sceneId, selfId, targetId )

	--(1)�Ƿ����
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["tem"] )
		return 0
	end
	
	--ȡ��������������������1��
	local TeamSize = LuaFnGetTeamSize( sceneId, selfId )
	TotalTeamNum = TeamSize
	if TeamSize == 1 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["tem"] )
		return 0
	end

	--ȡͬ������������
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
	if TeamSizeSameScene+1 ~= TeamSize then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["ten"] )
		return 0
	end

	--(2)�Ƿ�ӳ�
	if LuaFnIsTeamLeader( sceneId, selfId ) ~= 1 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["cap"] )
		return 0
	end
	
	--(3)�����Ƿ����
	if IsInDist( sceneId, selfId, targetId, 6 ) ~= 1 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["ner"] )
		return 0
	end
	
	--(4)��Ա���Ƿ���ڷ��ޡ�ʦͽ����ݡ��Ǻ��ѹ�ϵ
	local i = 0
	local j = 0
	local theID = 0
	local otherID = 0
	local Friend1 = 0
	local Friend2 = 0
	local Brothers = 0
	local BrotherNum = LuaFnIsSweared(sceneId, selfId) --�ӳ��Ƿ��ݹ�
	while i < TeamSizeSameScene do
		theID = LuaFnGetTeamSceneMember( sceneId, selfId, i )

		--�Ƿ����
		if LuaFnIsSpouses(sceneId, selfId, theID) == 1 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["mar"] )
			return 0
		end

		--�Ƿ�ʦ��
		if LuaFnIsMaster(sceneId, selfId, theID) == 1 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["mat"] )
			return 0
		end

		--�Ƿ�ͽ��
		if LuaFnIsPrentice(sceneId, theID, selfId) == 1 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["mat"] )
			return 0
		end

		--�Ƿ����
		if LuaFnIsFriend(sceneId, selfId, theID) == 0 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["fri"] )
			return 0
		end
		if LuaFnIsFriend(sceneId, theID, selfId) == 0 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["fri"] )
			return 0
		end

		--�Ѻö��Ƿ�>=1000
		Friend1 = LuaFnGetFriendPoint( sceneId, selfId, theID )
		Friend2 = LuaFnGetFriendPoint( sceneId, theID, selfId )
		if Friend1 < 1000 or Friend2 < 1000 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["frd"] )
			return 0
		end
		
		--�����Ƿ����
		if IsInDist( sceneId, theID, targetId, 6 ) ~= 1 then
			local	theName	= LuaFnGetName( sceneId, theID )
			x806001_MessageBox( sceneId, selfId, targetId, " ���Ķ�����#R" .. theName .. "#W������̫Զ���������޷�Ϊ���ǽ�ݡ�" )
			x806001_MessageBox( sceneId, theID, targetId, x806001_g_msg_swear["nel"] )
			return 0
		end

		--�Ƿ��Ѿ��н�ݹ�ϵ
		local theSwear = LuaFnIsSweared(sceneId, theID)
		if theSwear > 0 then --��Ա�н�ݹ�ϵ
			if BrotherNum > 0 then --�ӳ��н�ݹ�ϵ
				if LuaFnIsBrother(sceneId, selfId, theID) == 0 then
					local	theName	= LuaFnGetName( sceneId, theID )
					x806001_MessageBox( sceneId, selfId, targetId, " ���Ķ�����" .. theName .. "�Ѿ��Ǳ��˵Ľ���ֵܣ����޷��ٸ��������ֽ����ʽ�ˡ�" )
					return 0
				end
			else
				local	theName	= LuaFnGetName( sceneId, theID )
				x806001_MessageBox( sceneId, selfId, targetId, " ���Ķ�����" .. theName .. "�Ѿ��Ǳ��˵Ľ���ֵܣ����޷��ٸ��������ֽ����ʽ�ˡ�" )
			end
		end
		
		--����ӳ��Ѿ��н�ݹ�ϵ�������������е���ӳ����ֵܵ��˷ŵ�DIC����ȥ
		if theSwear > 0 and BrotherNum > 0 then
			Brothers = Brothers + 1
		end

		--������Ա
		j = i
		while j < TeamSizeSameScene do
			otherID = LuaFnGetTeamSceneMember( sceneId, theID, j )
			if LuaFnIsSpouses(sceneId, theID, otherID) == 1 then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["mar"] )
				return 0
			end
			if LuaFnIsMaster(sceneId, theID, otherID) == 1 then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["mat"] )
				return 0
			end
			if LuaFnIsPrentice(sceneId, otherID, theID) == 1 then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["mat"] )
				return 0
			end
			if LuaFnIsFriend(sceneId, theID, otherID) == 0 then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["fri"] )
				return 0
			end
			if LuaFnIsFriend(sceneId, otherID, theID) == 0 then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["fri"] )
				return 0
			end
			Friend1 = LuaFnGetFriendPoint( sceneId, theID, otherID )
			Friend2 = LuaFnGetFriendPoint( sceneId, otherID, theID )
			if Friend1 < 1000 or Friend2 < 1000 then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["frd"] )
				return 0
			end
			j = j + 1
		end
		i = i + 1
	end
		
	--(5)����ӳ��н�ݹ�ϵ���������е��ֵ��Ƿ��������������
	if BrotherNum > 0 then
		-- �ֵ�������ͬ�����Ķ�Ա��
		if BrotherNum == Brothers then
			if BrotherNum == TeamSizeSameScene then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["one"] )
				return 0
			end
		else
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["all"] )
			return 0
		end
	end
	
	return 1

end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806001_MessageBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806001_ConfirmSwear( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x806001_g_msg_swear["con"] )
		AddNumText( sceneId, x806001_g_ScriptId, "ȷ�Ͻ��", 6, x806001_g_key["confi"] )
		AddNumText( sceneId, x806001_g_ScriptId, "�Ҳ�������", 8, x806001_g_key["uncon"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ȷ�ϻ��ѶԻ�����
--**********************************
function x806001_OnSubmit( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local msg	= format( x806001_g_msg_swear["mon"], x806001_g_NeedMoney )
		AddText( sceneId, msg )
		AddNumText( sceneId, x806001_g_ScriptId, "ȷ��", 6, x806001_g_key["allow"] )
		AddNumText( sceneId, x806001_g_ScriptId, "ȡ��", 8, x806001_g_key["unall"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ȷ��ͬ��Ի�����
--**********************************
function x806001_OnConfirm( sceneId, selfId, targetId )
	x806001_ConfirmSwear( sceneId, selfId, targetId )

	local i = 0
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
	while i < TeamSizeSameScene do
		x806001_ConfirmSwear( sceneId, LuaFnGetTeamSceneMember( sceneId, selfId, i ), targetId )
		i = i + 1
	end
end

--**********************************
--��¼������Ϣ
--**********************************
function x806001_LogTeamInfo( sceneId, selfId, targetId )
	LuaFnTeamSnapshort( sceneId, selfId )
	local i = 0
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
	while i < TeamSizeSameScene do
		LuaFnTeamSnapshort( sceneId, LuaFnGetTeamSceneMember( sceneId, selfId, i ) )
		i = i + 1
	end
end

--**********************************
--�������
--**********************************
function x806001_QuitSwear( sceneId, selfId, targetId )

	--�ر��Լ��Ĵ���
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
	
	--�������˷���Ϣ
	local TeamLeaderID = GetTeamLeader( sceneId, selfId )
	if TeamLeaderID ~= nil then
		local i = 0
		local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, TeamLeaderID )
		local	msg = LuaFnGetName( sceneId, selfId ) .. "˼���������˳��˽����ʽ��"
		if TeamLeaderID ~= selfId then
			x806001_MessageBox( sceneId, selfId, targetId, msg )
			x806001_MessageBox( sceneId, TeamLeaderID, targetId, msg )
		end
		while i < TeamSizeSameScene do
			local theID = LuaFnGetTeamSceneMember( sceneId, TeamLeaderID, i )
			if theID ~= selfId then
				x806001_MessageBox( sceneId, selfId, targetId, msg )
				x806001_MessageBox( sceneId, theID, targetId, msg )
			end
			i = i + 1
		end
	end
end

--**********************************
--��¼ͬ������Ϣ
--**********************************
function x806001_AgreeSwear( sceneId, selfId, targetId )
	LuaFnAgreeSwear( sceneId, selfId, selfId )
	local i = 0
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
	while i < TeamSizeSameScene do
		local theID = LuaFnGetTeamSceneMember( sceneId, selfId, i )
		LuaFnAgreeSwear( sceneId, theID, selfId )
		i = i + 1
	end
end

--**********************************
--�鿴�Ƿ������˶�ͬ����
--**********************************
function x806001_CheckIfAllAgreeSwear( sceneId, selfId, targetId )
	--����Ƿ������˶�ͬ����
	if LuaFnIfAllTeamAgreeSwear(sceneId, selfId) == 0 then
		return 0
	end
	local i = 0
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
	while i < TeamSizeSameScene do
		local theID = LuaFnGetTeamSceneMember( sceneId, selfId, i )
		if LuaFnIfAllTeamAgreeSwear(sceneId, theID) == 0 then
			return 0
		end
		i = i + 1
	end
	return 1
end

--**********************************
--��ʵ�Ľ�ݲ���
--**********************************
function x806001_DoSwear( sceneId, selfId, targetId )
	local TeamLeaderID = GetTeamLeader( sceneId, selfId )
	
	--�ӳ�û��:(
	if TeamLeaderID == nil then
		return 0
	end
	
	local BrotherNum = LuaFnIsSweared(sceneId, TeamLeaderID)
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, TeamLeaderID )
	
	--����Ƿ��Ѿ������
	if BrotherNum == TeamSizeSameScene then
		return 0
	end

	--�������Ƿ��б仯
	if LuaFnVerifyTeamWithSnapshort( sceneId, TeamLeaderID ) == 0 then
		x806001_MessageBox( sceneId, TeamLeaderID, targetId, x806001_g_msg_swear["chn"] )
		return 0
	end
	
	--�鿴��Ա���ϵ�Ƿ��б仯
	if x806001_CheckAccept( sceneId, TeamLeaderID, targetId ) == 0 then
		x806001_MessageBox( sceneId, TeamLeaderID, targetId, x806001_g_msg_swear["chn"] )
		return 0
	end
	
	--���ɹ��ˣ��Ͻ���Ѿ10������
	--local Cost = LuaFnCostMoney( sceneId, TeamLeaderID, 100000 )
	--hzp 2008-12-9
	local jzCost, jbCost = LuaFnCostMoneyWithPriority( sceneId, TeamLeaderID, 100000 );	
	
	--û�۳ɹ�����
	--if Cost == nil or Cost <= 0 then
	if jzCost == -1 then
		local msg	= format( x806001_g_msg_swear["nom"], x806001_g_NeedMoney )
		x806001_MessageBox( sceneId, TeamLeaderID, targetId, msg )
		return 0
	end
	
	local Names = LuaFnGetName( sceneId, TeamLeaderID )
	
	--�޸Ķӳ������б�
	LuaFnAllTeamSwear( sceneId, TeamLeaderID )
	
	--�޸������˺����б�
	local i = 0
	while i < TeamSizeSameScene do
		local theID = LuaFnGetTeamSceneMember( sceneId, TeamLeaderID, i )
		LuaFnAllTeamSwear( sceneId, theID )
		Names = Names .. "," .. LuaFnGetName( sceneId, theID )
		i = i + 1
	end
	
	--�öӳ���ƺ�
	x806001_MessageBox( sceneId, TeamLeaderID, targetId, x806001_g_msg_swear["pro"] )
	i = 0
	while i < TeamSizeSameScene do
		local theID = LuaFnGetTeamSceneMember( sceneId, TeamLeaderID, i )
		x806001_MessageBox( sceneId, theID, targetId, x806001_g_msg_swear["pro"] )
		i = i + 1
	end
	
 		--ϵͳ�㲥��Ϣ
	local leaderObjId = selfId;
	local sAllUserName="";
		
	local TeammateCount = GetTeamMemberCount( sceneId, selfId );	
	local sUserName;

	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
	for	i=0,nearteammembercount-1 do
		local idMem = GetNearTeamMember(sceneId, selfId, i)
		sUserName = GetName(sceneId, idMem);				
		local sUserName2 = format("#B#{_INFOUSR%s}#Y", sUserName);		
		sAllUserName = sAllUserName..sUserName2;		
		if i ~= nearteammembercount-1 then
			sAllUserName = sAllUserName.."��"
		end			
	end
			
	local sMessage = format("#{JieBai_00}%s#{JieBai_01}",  sAllUserName);	
	BroadMsgByChatPipe(sceneId, selfId, sMessage, 4);
	
end

--**********************************
--�����ȡ�ƺ�
--**********************************
function x806001_CheckDrawTitle( sceneId, selfId, targetId )

	--(1)�Ƿ����
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["caa"] )
		return 0
	end
	
	--ȡ��������������������1��
	local TeamSize = LuaFnGetTeamSize( sceneId, selfId )
	TotalTeamNum = TeamSize
	if TeamSize == 1 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["caa"] )
		return 0
	end

	--ȡͬ������������
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
	if TeamSizeSameScene+1 ~= TeamSize then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["caa"] )
		return 0
	end

	--(2)�Ƿ�ӳ�
	if LuaFnIsTeamLeader( sceneId, selfId ) ~= 1 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["cac"] )
		return 0
	end
	
	--(3)�Ƿ��ݹ�
	local BrotherNum = LuaFnIsSweared(sceneId, selfId)
	if BrotherNum == 0 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["cas"] )
		return 0
	end

	--(4)�Ƿ�������в��ǽ���ֵܵĶ�Ա
	local i = 0
	local theID = 0
	local Brothers = 0
	while i < TeamSizeSameScene do
		theID = LuaFnGetTeamSceneMember( sceneId, selfId, i )
		if LuaFnIsBrother(sceneId, selfId, theID) == 0 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["cab"] )
			return 0
		end
		Brothers = Brothers + 1
		i = i + 1
	end

	--(5)�Ƿ����ж�Ա������
	if BrotherNum ~= Brothers then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["caa"] )
		return 0
	end

	--(6)�Ƿ����㹻�Ľ�Ǯ
	--hzp 2008-12-26
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
	--if LuaFnGetMoney( sceneId, selfId ) < x806001_g_DrawTitleNeedMoney then	
	if nMoneySelf < x806001_g_DrawTitleNeedMoney then	
		local msg	= format( x806001_g_msg_swear["nom"], x806001_g_DrawTitleNeedMoney )
		x806001_MessageBox( sceneId, selfId, targetId, msg )
		return 0
	end
	
	--(7)�Ƿ��Ѿ�����ƺ���
	--��ȡ���ƺź���Ȼ������ȡ�ƺţ����ڵ�������������仯ʱ���޸Ľ���ֵܵĳƺ�
	
	--local title = LuaFnGetJieBaiName( sceneId, selfId )
	--if title ~= nil then
		--x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["cat"] )
		--return 0
	--end
	
	--���ض�����������
	return TeamSize
end

--**********************************
--����޸ĳƺ�
--**********************************
function x806001_CheckChangeTitle( sceneId, selfId, targetId )

	--(1)�Ƿ��ݹ�
	local BrotherNum = LuaFnIsSweared(sceneId, selfId)
	if BrotherNum == 0 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["ccs"] )
		return 0
	end
	
	--(2)�Ƿ���ȡ���ƺ�
	local title = LuaFnGetJieBaiName( sceneId, selfId )
	if title == nil then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["can"] )
		return 0
	end
	
	--(3)�Ƿ����㹻�Ľ�Ǯ
	--hzp 2008-12-26
	local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
	local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
	local nMoneySelf = nMoneyJZ + nMoneyJB;
	--if LuaFnGetMoney( sceneId, selfId ) < x806001_g_ChangeTitleNeedMoney then	
	if nMoneySelf < x806001_g_ChangeTitleNeedMoney then	
		local msg	= format( x806001_g_msg_swear["nmm"], x806001_g_ChangeTitleNeedMoney )
		x806001_MessageBox( sceneId, selfId, targetId, msg )
		return 0
	end
	
	return 1

end

--**********************************
--�ȴ�������ȷ���ĶԻ�������Ϣ��ʾ
--**********************************
function x806001_WaitSwear( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x806001_g_msg_swear["wait"] )		
		AddNumText( sceneId, x806001_g_ScriptId, "�Ҳ�������", 8, x806001_g_key["uncon"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
