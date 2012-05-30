--�������

--�ű���
x806005_g_ScriptId		= 806005

--���
x806005_g_Unmarry						= {}
x806005_g_Unmarry["Id"]			= 1001
x806005_g_Unmarry["Name"]		= "���"
x806005_g_Unmarry["Skills"]	= { {260,"һ�����޼���"}, {261,"�������޼���"}, {262,"�������޼���"},
												{263,"�ļ����޼���"}, {264,"�弶���޼���"}, {265,"�������޼���"},
												{266,"�߼����޼���"}, {267,"�˼����޼���"}, {268,"�ż����޼���"} }

--��ʾ��Ϣ
x806005_g_msg_unm					= {}
x806005_g_msg_unm["tem"]	= "  �������飬����Ů˫��2�����һ���������ҡ�"
x806005_g_msg_unm["mar"]	= "  ���ǻ�û����أ�ΪɶҪ�����"
x806005_g_msg_unm["gld"]	= "  �з���ҪЯ��#{_EXCHG55555}������顣"
x806005_g_msg_unm["ner"]	= "  ֻ��2�˶��ߵ�����߲ſ�����顣"

--**********************************
--������ں��� �������
--**********************************
function x806005_OnDefaultEvent( sceneId, selfId, targetId )
	local	tId, male, female	= x806005_CheckAccept( sceneId, selfId, targetId )
	if tId == 0 or male == 0 or female == 0 then
		return 0
	end
	
	--ͬ�����
	if GetNumText() == 1 then
		x806005_OnAccept( sceneId, male, female )
		x806005_MessageBox( sceneId, tId, targetId, "  �Է��Ѿ�����������������" )
		
		--�رս���		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
	--��ͬ�����
	if GetNumText() == 2 then
		x806005_MessageBox( sceneId, tId, targetId, "  ���ź����Է�û��ͬ���������" )
		
		--�رս���		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
	
	x806005_OnSubmit( sceneId, selfId, targetId, tId )
	return 1
end

--**********************************
--�о��¼�
--**********************************
function x806005_OnEnumerate( sceneId, selfId, targetId )
	if LuaFnIsMarried( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x806005_g_ScriptId, x806005_g_Unmarry["Name"] , 6, -1)
	end
end

--**********************************
--����������
--**********************************
function x806005_CheckAccept( sceneId, selfId, targetId )
	--(1)�������ӣ����Ҷ���ֻ��2����
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x806005_MessageBox( sceneId, selfId, targetId, x806005_g_msg_unm["tem"] )
		return 0, 0, 0
	end
	if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		x806005_MessageBox( sceneId, selfId, targetId, x806005_g_msg_unm["tem"] )
		return 0, 0, 0
	end
	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		x806005_MessageBox( sceneId, selfId, targetId, x806005_g_msg_unm["tem"] )
		return 0, 0, 0
	end

	--(2)�������Ƿ�A��B�ķ����B��A������
	local	selfSex	= LuaFnGetSex( sceneId, selfId )
	local tId			= LuaFnGetTeamSceneMember( sceneId, selfId, 0 )
	local tSex		= LuaFnGetSex( sceneId, tId )
	if selfSex == tSex then
		x806005_MessageBox( sceneId, selfId, targetId, x806005_g_msg_unm["mar"] )
		return 0, 0, 0
	end
	local	male, female
	if selfSex == 1 then
		male 		= selfId
		female	= tId
	else
		male		= tId
		female	= selfId
	end
	
	--�����Ƿ���
	if LuaFnIsSpouses( sceneId, male, female ) == 0 then
		x806005_MessageBox( sceneId,selfId, targetId, x806005_g_msg_unm["mar"] )
		return 0, 0, 0
	end
	
	--�ű��Ƿ��������ִ��
	if LuaFnIsCanDoScriptLogic( sceneId, male ) ~= 1 then
		return 0, 0, 0
	end
	if LuaFnIsCanDoScriptLogic( sceneId, female ) ~= 1 then
		return 0, 0, 0
	end

	--(3)�з�����Я����Ǯ�Ƿ���ڵ���N=55555
	--hzp 2008-12-10
		local nMoneyJZ = GetMoneyJZ(sceneId, male);
		local nMoneyJB = LuaFnGetMoney(sceneId, male);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
	if nMoneySelf < 55555 then
		x806005_MessageBox( sceneId, selfId, targetId, x806005_g_msg_unm["gld"] )
		return 0, 0, 0
	end
	
	--(4)A��B�����Ƿ񲻴���10��
	if IsInDist( sceneId, selfId, tId, 10 ) ~= 1 then
		x806005_MessageBox( sceneId, selfId, targetId, x806005_g_msg_unm["ner"] )
		return 0, 0, 0
	end

	return tId, male, female
end

--**********************************
--ȷ��˫����Ը���
--**********************************
function x806005_OnSubmit( sceneId, selfId, targetId, tId )
	local	selfName	= LuaFnGetName( sceneId, selfId )
	BeginEvent( sceneId )
		AddText( sceneId, "  �ȴ��Է��𸲡�����#r  ���󣬷���˫�����ѺöȽ�����10��ͬʱ��ѧ�ķ��޼��ܽ���ȫ����ա�#rע�⣬�����Ҫ�з�����#{_EXCHG55555}" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  ��ͬ����"..selfName.."��������󣬷���˫�����ѺöȽ�����10��ͬʱ��ѧ�ķ��޼��ܽ���ȫ����ա�#rע�⣬�����Ҫ�з�����#{_EXCHG55555}" )
		AddNumText( sceneId, x806005_g_ScriptId, "��", 6, 1 )		-- 9 + i �ƶ��ͻ����ض���ͼ�� (ѡ��ͼ��Ϊ������)
		AddNumText( sceneId, x806005_g_ScriptId, "��", 8, 2 )		-- 9 + i �ƶ��ͻ����ض���ͼ�� (ѡ��ͼ��Ϊ������)
	EndEvent( sceneId )
	DispatchEventList( sceneId, tId, targetId )
end

--**********************************
--����
--**********************************
function x806005_OnAccept( sceneId, male, female )
	--(1)�۳��з����Ͻ�Ǯ55555
	--LuaFnCostMoney( sceneId, male, 55555 )
	LuaFnCostMoneyWithPriority(sceneId, male, 55555);	
	
	--(2)��˫���ĺ��Ѷȶ����ó�N=X��10����XΪ�ܹ������Է����ߵ����ֵ
	LuaFnSetFriendPoint( sceneId, male, female, 10 )
	LuaFnSetFriendPoint( sceneId, female, male, 10 )
	
	--(3)ɾ���ƺ�
	LuaFnAwardSpouseTitle( sceneId, female, "" )
	DispatchAllTitle( sceneId, female )
	LuaFnAwardSpouseTitle( sceneId, male, "" )
	DispatchAllTitle( sceneId, male )

	--(4)���촰�ڸ��з���ʾ
	Msg2Player( sceneId, male, "��ָ������ˡ�", MSG2PLAYER_PARA )
--Msg2Player( sceneId, male, "�Ѿ��黹�˽���ָ��", MSG2PLAYER_PARA )
	Msg2Player( sceneId, male, "ʧȥ���޳ƺš�", MSG2PLAYER_PARA )
	Msg2Player( sceneId, male, "ʧȥ���з��޼��ܡ�", MSG2PLAYER_PARA )

	--(5)���촰�ڸ�Ů����ʾ
	Msg2Player( sceneId, female, "��ָ������ˡ�", MSG2PLAYER_PARA )
--Msg2Player( sceneId, female, "�Ѿ��黹�˽���ָ��", MSG2PLAYER_PARA )
	Msg2Player( sceneId, female, "ʧȥ���޳ƺš�", MSG2PLAYER_PARA )
	Msg2Player( sceneId, female, "ʧȥ���з��޼��ܡ�", MSG2PLAYER_PARA )
	
	--(6)ɾ�����޼���
	local skillId
	for _, skillId in x806005_g_Unmarry["Skills"] do
		DelSkill( sceneId, male, skillId[1] )
		DelSkill( sceneId, female, skillId[1] )
	end
	
	NewSkill = { 250, 251, 252, 253, 254, 255, 256, 257, 258, 259 }
	for _, skillId in NewSkill do
		DelSkill( sceneId, male, skillId )
		DelSkill( sceneId, female, skillId )
	end
	
	--ɾ����Ӱ���뼼��
	for _, skillId in { 269,270,271,272,273 } do
		DelSkill( sceneId, male, skillId )
		DelSkill( sceneId, female, skillId )
	end
	
	--(7)ɾ����Ӧ���ʱ������
	CallScriptFunction(250036, "OnAbandon", sceneId, male);
	CallScriptFunction(250037, "OnAbandon", sceneId, male);
	
	CallScriptFunction(250036, "OnAbandon", sceneId, female);
	CallScriptFunction(250037, "OnAbandon", sceneId, female);
	
	--���»��������0
	SetMissionData( sceneId, male, MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT, 0 )
	SetMissionData( sceneId, female, MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT, 0 )

	LuaFnUnMarry( sceneId, male, female )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806005_MessageBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
