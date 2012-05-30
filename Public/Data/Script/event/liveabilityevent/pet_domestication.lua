--���޲���Ѫ�Ϳ��ֶ�

--�ű���
x701603_g_ScriptId	= 701603

--**********************************
--������ں���
--**********************************
function x701603_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum )
	--�������������������0���������Ӧ��ʾ
	local PetNum		= LuaFnGetPetCount( sceneId, selfId )
	local NpcName
	if PetNum <= 0 then
		local NpcName	= GetName( sceneId, targetId )
		BeginEvent( sceneId )
			AddText( sceneId, "  <"..NpcName.."��ͷ������ϸ�������㣬�����˿��������ҿ��˿���Ȼ����������˿��������۶���˵>#r  �������д���������" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	--��ȡ��ս���޵�ObjId
	local	ObjId			= x701603_FightingPet( sceneId, selfId )
	
	--���������������Ҫ����Ǯ
	local	MoneyCost	= 0
	local i
	for i=0, PetNum-1, 1 do
		MoneyCost	= MoneyCost + x701603_CalcMoney_hp( sceneId, selfId, i )
	end

	if MoneyCost == 0 then
		BeginEvent( sceneId )
			AddText(sceneId, "  ������޺ܽ���������Ҫ���ơ�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		--ȡ��ָ��������ϵ����ежԿ���ɢפ��Ч��
		if ObjId >= 0 then
			LuaFnDispelAllHostileImpacts( sceneId, ObjId )
		end
		return
	end
	
	local	Pet_MaxHP
	local PetID_H, PetID_L
	if ButtomNum == PET_FULL then
		BeginEvent( sceneId )
			AddText( sceneId, "  ����Ҫ����#G#{_EXCHG"..MoneyCost.."}#W��ȷ��Ҫ�����޻ָ�ô��" )
			--ȷ�������޼�Ѫ��ť
			AddNumText( sceneId, x701603_g_ScriptId, "�õ�", 6, PET_FULL_OK )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif ButtomNum == PET_FULL_OK then
		-- �õ����Ӻͽ�Ǯ��Ŀ
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		
		--�������Ƿ����㹻���ֽ�
		if (nMoneyJZ + nMoney >= MoneyCost) then

			--�۳����Ӻͽ�Ǯ
			local moneyJZ, money = LuaFnCostMoneyWithPriority ( sceneId, selfId, MoneyCost )
		
			--���޻�Ѫ
			for i=0, PetNum-1, 1 do
				Pet_MaxHP	= LuaFnGetPet_MaxHP( sceneId, selfId, i )

				--��������index�õ�����guid
				PetID_H, PetID_L = LuaFnGetPetGUID( sceneId, selfId, i )
				--����HP
				LuaFnSetPetHP( sceneId, selfId, PetID_H, PetID_L, Pet_MaxHP )
			end
			
			--ȡ��ָ��������ϵ����ежԿ���ɢפ��Ч��
			if ObjId >= 0 then
				LuaFnDispelAllHostileImpacts( sceneId, ObjId )
			end

			--��npc���촰��֪ͨ��һ����˶���Ǯ����������������Ѿ��ָ���
			if (moneyJZ == MoneyCost) then
				-- ֻ�۽���
				BeginEvent( sceneId )
					AddText( sceneId, "  �㻨����#G#{_EXCHG"..moneyJZ.."}#W��������޶��ָ����ˡ�" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )

			elseif (moneyJZ > 0) and (moneyJZ + money) == MoneyCost then
				-- �۳����Ӻͽ�Ǯ
				BeginEvent( sceneId )
					AddText( sceneId, "  �㻨����#G#{_EXCHG"..moneyJZ.."}#W��" )
					AddText( sceneId, "  �㻨����#G#{_MONEY"..money.."}#W��" )
					AddText( sceneId, "  ������޶��ָ����ˡ�" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )

			elseif (moneyJZ == 0) and ( money == MoneyCost) then
				-- �۳���Ǯ
				BeginEvent( sceneId )
					AddText( sceneId, "  �㻨����#G#{_MONEY"..money.."}#W��������޶��ָ����ˡ�" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )

			else			
				BeginEvent( sceneId )
					AddText( sceneId, "  �ָ�ʧ�ܡ�" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
			end
			
		-- Ǯ����
		else
			BeginEvent( sceneId )
				AddText( sceneId, "  ��Ľ�Ǯ���㣡" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
			return

		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x701603_OnEnumerate( sceneId, selfId, targetId )
	--��Ӱ�ť
	AddNumText(sceneId,x701603_g_ScriptId,"�����޻ָ���Ѫ", 6,PET_FULL)	--�����PET_FULL��������ʾ�����ť�ǵ�һ��ҳ�����ʾ��ť������ȷ���ָ��İ�ť
	return
end

--**********************************
--����������
--**********************************
function x701603_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701603_OnAccept( sceneId, selfId, ABILITY_CAIKUANG )
end

--**********************************
--����ָ�Ѫ����
--**********************************
--��λѪѱ����ֵ��0.025+n*0.0005��nΪ���޵ȼ���
--��λ���ֶȼ�ֵ��0.373+0.44*n��nΪ���޵ȼ���
function x701603_CalcMoney_hp( sceneId, selfId, index )
	local lv			= LuaFnGetPet_Level( sceneId, selfId, index )
	local	hp			= LuaFnGetPet_HP( sceneId, selfId, index )
	local	hp_max	= LuaFnGetPet_MaxHP( sceneId, selfId, index )
	if hp >= hp_max then
		return 0
	end

	local	gld	= floor( ( 0.025+lv*0.0005 ) * (hp_max-hp) )
	if gld < 1 then
		gld			= 1
	end
	return gld
end

--**********************************
--��ȡ��ս���޵�ObjId
--**********************************
function x701603_FightingPet( sceneId, selfId )
	local	PetNum	= LuaFnGetPetCount( sceneId, selfId )
	local	i
	local	PetID_H, PetID_L
	local	objId
	if PetNum <= 0 then
		return -1
	end
	
	for i=0, PetNum-1, 1 do
		--��������index�õ�����guid
		PetID_H, PetID_L = LuaFnGetPetGUID( sceneId, selfId, i )
		objId	= LuaFnGetPetObjIdByGUID( sceneId, selfId, PetID_H, PetID_L )
		
		if objId >= 0 then
			return objId
		end
	end
	return -1
end
