--����NPC
--�ŵ���
--��ͨ

x002075_g_ScriptId	= 002075

--�������(���ܱ�š��������ơ����Ľ�Ǯ)
x002075_g_Ability				= {}
x002075_g_Ability["aid"]= 39
x002075_g_Ability["nam"]= "�������"
x002075_g_Ability["gld"]= 300000		--30G
x002075_g_LevMax				= 3					--��ѧϰ����ߵȼ�

--������
x002075_g_Key				= {}
x002075_g_Key["nul"]= 0		--ɶ��û��
x002075_g_Key["stu"]= 1		--ѧϰ����
x002075_g_Key["sty"]= 101	--ȷ��ѧϰ
x002075_g_Key["stn"]= 100	--����ѧϰ
x002075_g_Key["lup"]= 2		--��������
x002075_g_Key["upy"]= 201	--ȷ������
x002075_g_Key["upn"]= 200	--��������
x002075_g_Key["des"]= 3		--��λ������


--**********************************
--�¼��������
--**********************************
function x002075_OnDefaultEvent( sceneId, selfId, targetId )
	local	lev	= QueryHumanAbilityLevel( sceneId, selfId, x002075_g_Ability["aid"] )
	BeginEvent( sceneId )
		AddText( sceneId, "  �ҿ��Դ��ڸ���һ������ļ��ܣ��������ּ������������ķ��Ŀ��Լ�¼λ����Ϣ���Ժ������ٻص������¼�ĵط���ֻҪʹ�÷��ľͿ����ˡ�" )
		AddText( sceneId, "  ��ע�⣬Խ�߼��ķ��Ŀ���ʹ�õĴ���Ҳ��Խ��Խ�ࡣ" )
		if GetLevel( sceneId, selfId ) >= 30 then
			if lev <= 0 then
				AddNumText( sceneId, x002075_g_ScriptId, "ѧϰ"..x002075_g_Ability["nam"], 6, x002075_g_Key["stu"] )
			else
				AddNumText( sceneId, x002075_g_ScriptId, "��������", 6, x002075_g_Key["lup"] )
			end			
			AddNumText( sceneId, x002075_g_ScriptId, "ʲôҲ����", -1, x002075_g_Key["nul"] )
		end
		AddNumText( sceneId, x002075_g_ScriptId, "��λ������", 11, x002075_g_Key["des"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002075_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
	local	lev	= QueryHumanAbilityLevel( sceneId, selfId, x002075_g_Ability["aid"] )
	local exp = GetAbilityExp( sceneId, selfId, x002075_g_Ability["aid"] )	--������
	local ret, demandMoney, _, limitAbilityExp, limitAbilityExpShow, _, limitLevel
		= LuaFnGetAbilityLevelUpConfig( x002075_g_Ability["aid"], lev + 1 )

	--��λ������
	if key == x002075_g_Key["des"]	then

		x002075_MsgBox( sceneId, selfId, targetId, "#{function_help_020}" )

	--ѧϰ����
	elseif key == x002075_g_Key["stu"]	then
	
		if GetLevel( sceneId, selfId ) < 30 then--�Ƿ�����ߵ����Ҳ����Ҫ��ʾ��
			return 0
		end

		x002075_OnAsk( sceneId, selfId, targetId, x002075_g_Key["stu"], "  ��ѧϰ�������Ҫ����#{_EXCHG" .. demandMoney .. "}���Ƿ������" )
	
	--ȷ��ѧϰ
	elseif key == x002075_g_Key["sty"] then
	
		if GetLevel( sceneId, selfId ) < 30 then--�Ƿ�����ߵ����Ҳ����Ҫ��ʾ��
			return 0
		end

		if lev > 0 then
			x002075_MsgBox( sceneId, selfId, targetId, "  ���Ѿ�ѧϰ���˼����ˣ�" )
			return 0
		end

		if LuaFnGetMoney( sceneId, selfId )+GetMoneyJZ( sceneId, selfId ) < demandMoney then
			x002075_MsgBox( sceneId, selfId, targetId, "  �����ϵ��ֽ��㣬�޷�ѧϰ�˼��ܣ�" )
			return 0
		end

		LuaFnCostMoneyWithPriority( sceneId, selfId, demandMoney )
		SetHumanAbilityLevel( sceneId, selfId, x002075_g_Ability["aid"], 1 )
		x002075_SetMyPrescription( sceneId, selfId, 1 )
		x002075_MsgBox( sceneId, selfId, targetId, "  ��ϲ���Ѿ�ѧ����"..x002075_g_Ability["nam"].."���������������ʹ�ô�������Ķ�λ�������������ļ��ܡ�" )

	--��������
	elseif key == x002075_g_Key["lup"] then
		if GetLevel( sceneId, selfId ) < 30 then--�Ƿ�����ߵ����Ҳ����Ҫ��ʾ��
			return 0
		end
		
		if lev >= x002075_g_LevMax then
			x002075_MsgBox( sceneId, selfId, targetId, "  ���ļ��ܵȼ��Ѿ��㹻������Ҫ�ٴ�������" )
			return 0
		end
		x002075_OnAsk( sceneId, selfId, targetId, x002075_g_Key["lup"], "  �������������Ҫ����#{_EXCHG" .. demandMoney .. "}���Ƿ������" )

	--ȷ������
	elseif key == x002075_g_Key["upy"] then
		if ret ~= 1 then
			return 0
		end
		
		if GetLevel( sceneId, selfId ) < 30 then--�Ƿ�����ߵ����Ҳ����Ҫ��ʾ��
			return 0
		end

		if lev < 1 then
			x002075_MsgBox( sceneId, selfId, targetId, "  ����û��ѧϰ"..x002075_g_Ability["nam"].."����ѧ����1������֮�������������ɡ�" )
			return 0
		end

		if lev >= x002075_g_LevMax then
			x002075_MsgBox( sceneId, selfId, targetId, "  ���ļ��ܵȼ��Ѿ��㹻������Ҫ�ٴ�������" )
			return 0
		end

		if exp < limitAbilityExp then
			x002075_MsgBox( sceneId, selfId, targetId, "  ��Ҫ" .. limitAbilityExpShow .. "�������Ȳ����ٴ�������" )
			return 0
		end

		if LuaFnGetMoney( sceneId, selfId )+GetMoneyJZ( sceneId, selfId ) < demandMoney then
			x002075_MsgBox( sceneId, selfId, targetId, "  ��Ҫ#{_EXCHG" .. demandMoney .. "}�����ٴ�������" )
			return 0
		end

		--�����˼���
		LuaFnCostMoneyWithPriority( sceneId, selfId, demandMoney )
		SetHumanAbilityLevel( sceneId, selfId, x002075_g_Ability["aid"], lev+1 )
		x002075_SetMyPrescription( sceneId, selfId, lev+1 )
		x002075_MsgBox( sceneId, selfId, targetId, "  ���ļ����Ѿ��ɹ�����������ϲ������������߼��ķ����ˡ�" )

	else
		
		--�رս���		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

	end

	return 1
end

--**********************************
--������Ӧ�ȼ����䷽
--**********************************
function x002075_SetMyPrescription( sceneId, selfId, lev )
	--ÿ���ȼ���Ӧ6���䷽����ɫ����ɫ����ɫ����ɫ����ɫ����ɫ
	for i=0, 5 do
		SetPrescription( sceneId, selfId, 510+(lev-1)*6+i, 1 )
	end
end

--**********************************
--ѯ���Ƿ�������
--**********************************
function x002075_OnAsk( sceneId, selfId, targetId, key, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
		AddNumText( sceneId, x002075_g_ScriptId, "��", -1, key*100+1 )
		AddNumText( sceneId, x002075_g_ScriptId, "��", -1, key*100 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002075_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
