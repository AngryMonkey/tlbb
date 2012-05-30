--����NPC
--���
--��ͨ

x001069_g_ScriptId	= 001069

--������
x001069_g_Key				=
{
	["inf"]	= 1000,	--�������
	["ln"]	= 1,		--��Ҫѧϰ�����䷽ - ���� - ����
	["zh"]	= 2,		--��Ҫѧϰ�����䷽ - ���� - ����
	["gn"]	= 3,		--��Ҫѧϰ�����䷽ - ���� - ����
	["sh"]	= 4,		--�����䷽�̵�
}

--�̵���
x001069_g_shoptableindex=196

--**********************************
--�¼��������
--**********************************
function x001069_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "    ʮ��ĥһ����������������Ķ�����������õģ�" )
		if GetLevel( sceneId, selfId ) >= 10 then
			AddNumText( sceneId, x001069_g_ScriptId, "��Ҫѧϰ���������죩�䷽", 2, x001069_g_Key["ln"] )
			AddNumText( sceneId, x001069_g_ScriptId, "��Ҫѧϰ���ƣ����ң��䷽", 2, x001069_g_Key["zh"] )
			AddNumText( sceneId, x001069_g_ScriptId, "��Ҫѧϰ���������գ��䷽", 2, x001069_g_Key["gn"] )
			AddNumText( sceneId, x001069_g_ScriptId, "���򾫹��䷽", 7, x001069_g_Key["sh"])
		end
		AddNumText( sceneId, x001069_g_ScriptId, "�������", 11, x001069_g_Key["inf"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001069_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()

	if key == x001069_g_Key["inf"] then
		x001069_MsgBox( sceneId, selfId, targetId, "#{INTRO_ZHIZAO}" )
	
	elseif key == x001069_g_Key["ln"] then
		if QueryHumanAbilityLevel( sceneId, selfId, 46 ) ~= 1 then
			SetHumanAbilityLevel( sceneId, selfId, 46, 1 )
		end
		for i = 644, 703 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		x001069_MsgBox( sceneId, selfId, targetId, "    ��ϲ���Ѿ�ѧ�������еľ����䷽��" )

	elseif key == x001069_g_Key["zh"] then
		if QueryHumanAbilityLevel( sceneId, selfId, 47 ) ~= 1 then
			SetHumanAbilityLevel( sceneId, selfId, 47, 1 )
		end
		for i = 704, 773 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		for i = 804, 883 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		x001069_MsgBox( sceneId, selfId, targetId, "    ��ϲ���Ѿ�ѧ�������еľ����䷽��" )
	
	elseif key == x001069_g_Key["gn"] then
		if QueryHumanAbilityLevel( sceneId, selfId, 48 ) ~= 1 then
			SetHumanAbilityLevel( sceneId, selfId, 48, 1 )
		end
		for i = 774, 803 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		
		for i = 1064, 1075 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
 		
		x001069_MsgBox( sceneId, selfId, targetId, "    ��ϲ���Ѿ�ѧ�������еľ����䷽��" )
	elseif key == x001069_g_Key["sh"] then
		DispatchShopItem( sceneId, selfId, targetId, x001069_g_shoptableindex )
	end

end

--**********************************
--Message Box
--**********************************
function x001069_MsgBox( sceneId, selfId, targetId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end
