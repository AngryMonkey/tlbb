--�ű���
x830001_g_scriptId = 830001

x830001_ShiZhuang = {}
x830001_ShiZhuang[1] ={10124502,10124503,10124504,10124505,10124506,10124507,10124508,10124509}--10124501,������Ե
x830001_ShiZhuang[2] ={10124512,10124513,10124514,10124515,10124516,10124517,10124518,10124519}--10124511,ѩ��˪��
x830001_ShiZhuang[3] ={10124522,10124523,10124524,10124525,10124526,10124527,10124528,10124529}--10124521,��������
x830001_ShiZhuang[4] ={10124532,10124533,10124534,10124535,10124536,10124537,10124538,10124539}--10124531,�������
x830001_ShiZhuang[5] ={10124542,10124543,10124544,10124545,10124546,10124547,10124548,10124549}--10124541,������ѩ
x830001_ShiZhuang[6] ={10124552,10124553,10124554,10124555,10124556,10124557,10124558,10124559}--10124551,�����

--**********************************
--�¼��������
--**********************************
function x830001_OnDressPaint( sceneId, selfId,pos)
	local nItemId = GetItemTableIndexByIndex(sceneId, selfId, pos)
	local EquipPoint = GetItemEquipPoint( nItemId )
	local index=0
	if EquipPoint~=16 then
		x830001_NotifyTip( sceneId, selfId, "ֻ��ʱװ�ſ�Ⱦɫ" )
		return
	end
	if nItemId>=10124501 and nItemId<=10124509 then
		index=1
	elseif nItemId>=10124511 and nItemId<=10124519 then
		index=2
	elseif nItemId>=10124521 and nItemId<=10124529 then
		index=3
	elseif nItemId>=10124531 and nItemId<=10124539 then
		index=4
	elseif nItemId>=10124541 and nItemId<=10124549 then
		index=5
	elseif nItemId>=10124551 and nItemId<=10124559 then
		index=6
	end
	local myShiZhuang=x830001_ShiZhuang[index]
	if myShiZhuang~=nil then
		local reply = CostMoney(sceneId,selfId,50000)
		if reply == -1 then
			x830001_NotifyTip( sceneId, selfId, "��Ǯ����" )
			return
		end
		--if LuaFnGetAvailableItemCount(sceneId, selfId, 30503140) < 1 then
			--x830001_NotifyTip( sceneId, selfId, "ȱ�ٲ��ϣ���ҫʯ" )
			--return
		--end
		local i=random(1,8)
		--LuaFnDelAvailableItem(sceneId,selfId,30503140,1)
		LuaFnDelAvailableItem(sceneId,selfId,nItemId,1)
		BeginAddItem(sceneId)
			AddItem( sceneId, myShiZhuang[i], 1 )
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)
		x830001_NotifyTip( sceneId, selfId, "��ϲ��ʱװȾɫ�ɹ�" )
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  0910282)
	else
		x830001_NotifyTip( sceneId, selfId, "��ʱװ�޷�Ⱦɫ" )
	end	
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x830001_OnEventRequest( sceneId, selfId, targetId, eventId )
	
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x830001_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
