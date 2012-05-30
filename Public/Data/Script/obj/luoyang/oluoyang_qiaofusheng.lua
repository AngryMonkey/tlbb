--����NPC
--�Ǹ�ʢ
--��ͨ
x000109_g_scriptId=000109

--**********************************
--�¼��������
--**********************************
function x000109_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �벻���Լ��������ϰ壿�ҿ��Խ̸���Ŷ��")
		AddNumText(sceneId,x000109_g_scriptId,"�鿴�����̵�",6,2)
		if IsShutout( sceneId, selfId, ONOFF_T_PSHOP ) == 0 then
			AddNumText(sceneId,x000109_g_scriptId,"�����Լ����̵�",6,0)
		else
			AddNumText(sceneId,x000109_g_scriptId,"ע���ҵĵ���",6,7)
		end
		AddNumText(sceneId,x000109_g_scriptId,"�����Լ����̵�",6,1)
		AddNumText(sceneId,x000109_g_scriptId,"�鿴��׼���̳��ĵ�",6,3)
		AddNumText(sceneId,x000109_g_scriptId,"����̵����",11,6)
		AddNumText(sceneId,x000109_g_scriptId,"�����չ�����",11,10)

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************

--�¼��б�ѡ��һ��

--**********************************

function x000109_OnEventRequest( sceneId, selfId, targetId, eventId )

--0.�����Լ����̵�->��ʾ��������->�ɿͻ������󽨵�
		if	GetNumText()==0	then

			BeginEvent(sceneId)

				AddText(sceneId,"#{PS_OPEN_SHOP_NOTICE}")

			EndEvent(sceneId)

			DispatchMissionDemandInfo(sceneId,selfId,targetId,x000109_g_scriptId,0,1)


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

							if GetPlayerShopFrezeType(sceneId, selfId, 0) == 1 then
								AddNumText(sceneId,x000109_g_scriptId,"#cCCCCCC����1  "..strShop0Name,-1,4)
							else
								AddNumText(sceneId,x000109_g_scriptId,"����1  "..strShop0Name,-1,4)
							end
							if GetPlayerShopFrezeType(sceneId, selfId, 1) == 1 then
								AddNumText(sceneId,x000109_g_scriptId,"#cCCCCCC����2  "..strShop1Name,-1,5)
							else
								AddNumText(sceneId,x000109_g_scriptId,"����2  "..strShop1Name,-1,5)
							end

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
		
		--6.����̵����
		elseif	GetNumText()==6	then

			BeginEvent(sceneId)
				AddText( sceneId, "#{function_help_048}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)

		--7.�ٴ�ȷ���Ƿ�ɾ��
		elseif	GetNumText()==7	then
	
			--1.0ͨ�����������ж��Ƿ�˵��Ѿ���
			local strShop0Name = LuaFnGetShopName(sceneId, selfId, 0)
			local strShop1Name = LuaFnGetShopName(sceneId, selfId, 1)

			--1.1û����ֱ�ӷ�������ʾ
			if((strShop0Name == "")and(strShop1Name == "")) then
				BeginEvent(sceneId)
					strText = "��������Ҫӵ��һ�ҵ��̡�"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			else
				BeginEvent(sceneId)
					AddText(sceneId,"#{UnregisterShopHelp}")
					AddNumText(sceneId,x000109_g_scriptId,"ȷ��",6,8)
					AddNumText(sceneId,x000109_g_scriptId,"�뿪",6,9)
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end

		--7.ɾ!
		elseif	GetNumText()==8	then
			local canErase = CanErasePlayerShop(sceneId, selfId)
			if(canErase == 1) then
				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 1000)
				ErasePlayerShop(sceneId,selfId)
				local msg = format("��ϲ��ע���ɹ��������еı����Ѿ����ظ�������ע����ա�");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
				
				msg = format("���ѳɹ�ע�������̵�");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
				
				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 19810222)
			elseif canErase == -1 then
				local msg = format("�����̵��ѱ����ᡣ");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			else
				local msg = format("���ĵ��ڻ��г�����Ѷ���չ���Ѷ���ڷ���������պ�������");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			end
		elseif	GetNumText()==9	then
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1000)
		elseif	GetNumText()==10	then
			BeginEvent(sceneId)
				AddText( sceneId, "#{function_help_101}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end

end



--**********************************

--����

--**********************************

function x000109_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	ApplyPlayerShop( sceneId, selfId, targetId )

end
