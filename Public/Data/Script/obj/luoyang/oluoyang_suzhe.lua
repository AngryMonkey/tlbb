--����NPC
--����
--��ͨ

x000000_g_scriptId=000000

--**********************************

--�¼��������

--**********************************

function x000000_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"�����ǵ���ʥ�ϵ����ܣ��ʴ�����֮����Ȼ����ֻ��һʮ���꣬ȴ����һ�����������ȡ�")
		--AddText(sceneId,"�����ѡ���������Լ������̡�")

		--AddNumText(sceneId,x000000_g_scriptId,"�����Լ����̵�",6,0)
		--AddNumText(sceneId,x000000_g_scriptId,"�����Լ����̵�",6,1)
		--AddNumText(sceneId,x000000_g_scriptId,"�鿴�����̵�",6,2)

		--AddNumText(sceneId,x000000_g_scriptId,"�鿴��׼���̳��ĵ�",6,3)

		--AddNumText(sceneId,x000000_g_scriptId,"�������ڳ����ϵĳ���",6,6)
		--AddNumText(sceneId,x000000_g_scriptId,"ɾ�����ڳ����ϵĳ���",6,7)

		--AddNumText(sceneId,x000000_g_scriptId,"���뱾�����1",9,8)

	EndEvent(sceneId)

	DispatchEventList(sceneId,selfId,targetId)

end



--**********************************

--�¼��б�ѡ��һ��

--**********************************

function x000000_OnEventRequest( sceneId, selfId, targetId, eventId )

		--0.�����Լ����̵�->��ʾ��������->�ɿͻ������󽨵�
		if	GetNumText()==0	then

			BeginEvent(sceneId)

				AddText(sceneId,"#{PS_OPEN_SHOP_NOTICE}")

			EndEvent(sceneId)

			DispatchMissionDemandInfo(sceneId,selfId,targetId,x000000_g_scriptId,0,1)


		--1.�����Լ�����
		elseif	GetNumText()==1	then

			--1.0ͨ�����������ж��Ƿ�˵��Ѿ���
			strShop0Name = LuaFnGetShopName(sceneId, selfId, 0)
			strShop1Name = LuaFnGetShopName(sceneId, selfId, 1)

			--1.1û����ֱ�ӷ�������ʾ
			if((strShop0Name == "")and(strShop1Name == "")) then
				BeginEvent(sceneId)

					strText = "�Բ��������û�е��̡�"

					AddText(sceneId,strText);

				EndEvent(sceneId)

				DispatchMissionTips(sceneId,selfId)

			--1.2�е��̸��ݲ�ͬ�����ͬ����
			else
				--1.2.1���������̣��ȴ���һ��ѡ��
				if((strShop0Name ~= "") and (strShop1Name ~= "")) then
						BeginEvent(sceneId)

							AddText(sceneId,"ŶŶ��ԭ�����ƹ�ĵ��ˣ�������Ҫȥ�ļ�꿴����")

							AddNumText(sceneId,x000000_g_scriptId,"����1  "..strShop0Name,-1,4)
							AddNumText(sceneId,x000000_g_scriptId,"����2  "..strShop1Name,-1,5)

				EndEvent(sceneId)
						DispatchEventList(sceneId,selfId,targetId)

				--1.2.2ֻ��һ��ֱ�Ӵ����
				elseif(strShop0Name ~= "") then
						LuaFnOpenPlayerShop(sceneId, selfId, targetId, 0)

				--1.2.3ֻ��һ��ֱ�Ӵ����
				elseif(strShop1Name ~= "") then
						LuaFnOpenPlayerShop(sceneId, selfId, targetId, 1)
				end

			end

		--2.�쿴�����̵���б�

		elseif	GetNumText()==2	then

			DispatchPlayerShopList( sceneId, selfId, targetId )

		--3.�쿴�����̳��̵���б�
		elseif	GetNumText()==3	then

			DispatchPlayerShopSaleOutList( sceneId, selfId, targetId )

		--4.�쿴�Լ����ϵ�ָ���̵�
		elseif	GetNumText()==4	then

			LuaFnOpenPlayerShop(sceneId, selfId, targetId, 0)

		--5.�쿴�Լ����ϵ�ָ���̵�
		elseif	GetNumText()==5	then

			LuaFnOpenPlayerShop(sceneId, selfId, targetId, 1)
		end

		--6.
		if GetNumText() == 6 then
			CityApply(sceneId, selfId)
			--CityCreate(sceneId, selfId, 205)
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,targetId) --���ó�����������
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 101)

		--7.
		elseif GetNumText() == 7 then
			CityDelete(sceneId, selfId, 205, 0)

		--8.
		elseif GetNumText() == 8 then
			CityMoveTo(sceneId, selfId)
		end

end



--**********************************

--����

--**********************************

function x000000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	ApplyPlayerShop( sceneId, selfId, targetId )

end

