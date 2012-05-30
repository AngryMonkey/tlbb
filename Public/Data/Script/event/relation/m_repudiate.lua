--ǿ���������

--�ű���
x806004_g_ScriptId		= 806004

--ǿ�����
x806004_g_Repudiate						= {}
x806004_g_Repudiate["Id"]			= 1002
x806004_g_Repudiate["Name"]		= "ǿ�����"
x806004_g_Repudiate["Skills"]	= { {260,"һ�����޼���"}, {261,"�������޼���"}, {262,"�������޼���"},
													{263,"�ļ����޼���"}, {264,"�弶���޼���"}, {265,"�������޼���"},
													{266,"�߼����޼���"}, {267,"�˼����޼���"}, {268,"�ż����޼���"} }

--��ʾ��Ϣ
x806004_g_msg_rep					= {}
x806004_g_msg_rep["mar"]	= "  ��û�н�飬�������ô��"
x806004_g_msg_rep["gld"]	= "  ��ҪЯ��#{_EXCHG200000}������顣"

--**********************************
--������ں��� �������
--**********************************
function x806004_OnDefaultEvent( sceneId, selfId, targetId )
	if x806004_CheckAccept( sceneId, selfId, targetId ) == 0 then
		return 0
	end
	
	--ͬ�����
	if GetNumText() == 1 then
		x806004_OnAccept( sceneId, selfId )
		
		--�رս���		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
	--��ͬ�����
	if GetNumText() == 2 then
		--�رս���		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
	
	x806004_OnSubmit( sceneId, selfId, targetId )
	return 1
end

--**********************************
--�о��¼�
--**********************************
function x806004_OnEnumerate( sceneId, selfId, targetId )
	if LuaFnIsMarried( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x806004_g_ScriptId, x806004_g_Repudiate["Name"] , 6, -1 )
	end
end

--**********************************
--����������
--**********************************
function x806004_CheckAccept( sceneId, selfId, targetId )
	--(1)�ѻ�
	if LuaFnIsMarried( sceneId, selfId ) == 0 then
		x806004_MessageBox( sceneId, selfId, targetId, x806004_g_msg_rep["mar"] )
		return 0
	end
	
	--(2)����������Я����Ǯ���ڵ���N=200000
	--if LuaFnGetMoney( sceneId, selfId ) < 200000 then
	--hzp 2008-12-10
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
	if nMoneySelf < 200000 then
		x806004_MessageBox( sceneId, selfId, targetId, x806004_g_msg_rep["gld"] )
		return 0
	end

	return 1
end

--**********************************
--ȷ��˫����Ը���
--**********************************
function x806004_OnSubmit( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  ��ȷ��Ҫǿ����������󣬷���˫�����ѺöȽ�����10��ͬʱ��ѧ�ķ��޼��ܽ���ȫ����ա�#rҪ��ǿ������һ����Ҫ����#{_EXCHG200000}" )
		AddNumText( sceneId, x806004_g_ScriptId, "��", 6, 1 )		-- 9 + i �ƶ��ͻ����ض���ͼ�� (ѡ��ͼ��Ϊ������)
		AddNumText( sceneId, x806004_g_ScriptId, "��", 8, 2 )		-- 9 + i �ƶ��ͻ����ض���ͼ�� (ѡ��ͼ��Ϊ������)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x806004_OnAccept( sceneId, selfId )
	--��Ҫ��������
	if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) == 1 then
		if LuaFnIsPasswordUnlocked( sceneId, selfId, 1 ) == 0 then
			return
		end
	end
	
	--(1)�۳����������Ͻ�Ǯ200000
	--LuaFnCostMoney( sceneId, selfId, 200000 )
	LuaFnCostMoneyWithPriority(sceneId, selfId, 200000);	
	--(2)���Ѷ����ó�N=X��10����XΪ�ܹ������Է����ߵ����ֵ
	local SpouseGUID = LuaFnGetSpouseGUID( sceneId, selfId )
	LuaFnSetFriendPointByGUID( sceneId, selfId, SpouseGUID, 10 )

	--(3)ɾ���ƺ�
	LuaFnAwardSpouseTitle( sceneId, selfId, "" )
	DispatchAllTitle( sceneId, selfId )

	--(4)ɾ�����޼���
	local skillId
	for _, skillId in x806004_g_Repudiate["Skills"] do
		DelSkill( sceneId, selfId, skillId[1] )
	end
	
	NewSkill = { 250, 251, 252, 253, 254, 255, 256, 257, 258, 259 }
	for _, skillId in NewSkill do
		DelSkill( sceneId, selfId, skillId )
	end
	
	--ɾ����Ӱ���뼼��
	for _, skillId in { 269,270,271,272,273 } do
		DelSkill( sceneId, selfId, skillId )
	end
	
	local SpouseName	= LuaFnGetFriendName( sceneId, selfId, SpouseGUID )
	local selfName		= LuaFnGetName( sceneId, selfId )

	--����ͨ�ʼ�����ż֪ͨ���
	LuaFnSendSystemMail( sceneId, SpouseName, selfName .. "��ѡ��������ǿ������ˣ�������Ե�ɡ����ڻ������ѣ�����ѧ���޼�����ȫ����ա�" )
	--LuaFnSendNormalMail( sceneId, selfId, SpouseName, selfName .. "��ѡ��������ǿ������ˣ�������Ե�ɡ����ڻ������ѣ�����ѧ���޼�����ȫ����ա�" )
	
	--ɾ����Ӧ���ʱ������
	CallScriptFunction(250036, "OnAbandon", sceneId, selfId);
	CallScriptFunction(250037, "OnAbandon", sceneId, selfId);

	--����ִ���ʼ�����ż��ִ�����
	LuaFnSendScriptMail( sceneId, SpouseName, MAIL_REPUDIATE, LuaFnGetGUID( sceneId, selfId ), 0, 0 )

	LuaFnDivorce( sceneId, selfId )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806004_MessageBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
