--ʦ�µȼ���������

--�ű���
x806015_g_ScriptId = 806015

--�¼�
x806015_g_Update					= {}
x806015_g_Update["id"]		= 1000
x806015_g_Update["wu"]		= 1001
x806015_g_Update["uw"]		= 1002

--��ʾ��Ϣ
x806015_g_msg					= {}
x806015_g_msg["up"]	= "��Ҫ�����ҵ�ʦ�µȼ�"
x806015_g_msg["un"]	= "  ���ʦ�µȼ��Ѵ���ߣ��޷�������"
x806015_g_msg["nv"]	= "  ����ƶ�ֵ���㣬�޷�������"
x806015_g_msg["uc"]	= "  ������AҪ��B���ƶ�ֵ��"
x806015_g_msg["wu"]	= "��Ҫ�����ҵ�ʦ�µȼ�"
x806015_g_msg["uw"]	= "�һ��ǲ���������"
x806015_g_msg["ul"]	= "  ֻ�еȼ�����20�������ʸ�����ʦ���ƺš�"

x806015_g_Title		={}
x806015_g_Title[1] = "����ʦ��"
x806015_g_Title[2] = "�м�ʦ��"
x806015_g_Title[3] = "�߼�ʦ��"
x806015_g_Title[4] = "һ����ʦ"


--**********************************
--������ں��� ������ͽ
--**********************************
function x806015_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	
	--����ȷ��
	if key == x806015_g_Update["id"] then
		x806015_Upgrade( sceneId, selfId, targetId )
		return 0
	end
	

	--ͬ������
	if key == x806015_g_Update["wu"] then
		if x806015_DoUpgrade( sceneId, selfId, targetId ) == 0 then
			return 0
		end
		
		--BeginUICommand( sceneId )
		--UICommand_AddInt( sceneId, targetId )
		--EndUICommand( sceneId )
		--DispatchUICommand( sceneId, selfId, 1000 )

		local msg = "����ʦ�µȼ�������" .. tostring( LuaFnGetmasterLevel( sceneId, selfId ) .. "����" )
		x806015_MessageBox( sceneId, selfId, targetId, "  "..msg )
		Msg2Player( sceneId, selfId, msg, MSG2PLAYER_PARA )
		return 0
	end
	
	--��ͬ������
	if key == x806015_g_Update["uw"] then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
end

--**********************************
--�о��¼�
--**********************************
function x806015_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x806015_g_ScriptId, x806015_g_msg["up"], 6, x806015_g_Update["id"] )
end

--**********************************
--����������
--**********************************
function x806015_CheckAccept( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x806015_OnAccept( sceneId, selfId, targetId )
	x806015_OnConfirm( sceneId, selfId, targetId )
end

--**********************************
--�ύ
--**********************************
function x806015_OnSubmit( sceneId, selfId, targetId, tId )
end

--**********************************
--�ܾ�
--**********************************
function x806015_OnCancel( sceneId, selfId, targetId )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806015_MessageBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����ʦ�µȼ�ȷ�϶Ի���
--**********************************
function x806015_Upgrade( sceneId, selfId, targetId )
	local HumanLevel = LuaFnGetLevel( sceneId, selfId )
	local level = LuaFnGetmasterLevel( sceneId, selfId )
	
	if HumanLevel < 20 then
		x806015_MessageBox( sceneId, selfId, targetId, x806015_g_msg["ul"] )
		return 0
	end
	
	--����Ƿ��Ѿ������������
	if level >= 4 then
		x806015_MessageBox( sceneId, selfId, targetId, x806015_g_msg["un"] )
		return 0
	end
	
	--������Ҫ���ƶ�ֵ
	local exp = 0
	
	if level == 0 and HumanLevel < 60 then
		exp = 500
	elseif level == 1 then
		exp = 5000
	elseif level == 2 then
		exp = 25000
	elseif level == 3 then
		exp = 50000
	end
	
	local text = "  ��ʦ�µȼ�������" .. tostring( level + 1 ) .. "�����������ƶ�ֵ" .. tostring( exp ) .. "�㡣"
	BeginEvent( sceneId )
		AddText( sceneId, text )
		AddNumText( sceneId, x806015_g_ScriptId, x806015_g_msg["wu"], 6, x806015_g_Update["wu"] )
		AddNumText( sceneId, x806015_g_ScriptId, x806015_g_msg["uw"], 8, x806015_g_Update["uw"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	return 1
end

function x806015_DoUpgrade( sceneId, selfId, targetId )

	local HumanLevel = LuaFnGetLevel( sceneId, selfId )
	local level = LuaFnGetmasterLevel( sceneId, selfId )
	if level >= 4 then
--	x806015_MessageBox( sceneId, selfId, targetId, msg )
		return 0
	end
	
	--������Ҫ���ƶ�ֵ
	local exp = 0
	if level == 0 and HumanLevel < 60 then
		exp = 500
	elseif level == 1 then
		exp = 5000
	elseif level == 2 then
		exp = 25000
	elseif level == 3 then
		exp = 50000
	end
	
	--����ƶ�ֵ
	local gbvalue = LuaFnGetHumanGoodBadValue( sceneId, selfId )
	if gbvalue < exp then
		local msg = "  �����ƶ�ֵ���㣬��Ŀǰ���ƶ�ֵΪ" .. tostring( gbvalue ) .. "��"
		x806015_MessageBox( sceneId, selfId, targetId, msg )
		return 0
	end
	
	--����ʦ�µȼ�
	level = level + 1
	LuaFnSetmasterLevel( sceneId, selfId, level )
	
	--�۳��ƶ�ֵ
	gbvalue = gbvalue - exp
	LuaFnSetHumanGoodBadValue( sceneId, selfId, gbvalue )
	
	--�޸�ʦ�µȼ���سƺ�
	AwardMasterTitle( sceneId, selfId, x806015_g_Title[level] )
	DispatchAllTitle( sceneId, selfId )
	SetCurTitle( sceneId, selfId, 27, 0 )

	--ȫ�򹫸�
	local	nam	= GetName( sceneId, selfId )
	local	str	= format( "#I��ϲ#W#{_INFOUSR%s}#I�ɹ����#G%s#I�ĳƺţ����ڿ������������Ϊͽ�ˡ�", nam, x806015_g_Title[level] )
	AddGlobalCountNews( sceneId, str )
	
	--��Ч����Ч
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )

	return level
end
