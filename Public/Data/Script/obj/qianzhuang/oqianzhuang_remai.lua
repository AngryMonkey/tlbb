--����Ԫ�� NPC
--ע�Ȿ�ű���������Ԫ����ع��ܣ���һ���������е����ӽ����޸ġ�

x181002_g_scriptId 	= 181002
x181002_g_buyrate 	= 0.5

x181002_g_shoptableindex=151 --�Ѿ������ˣ�������188��189
x181002_g_goodact		= 1		--����Ԫ���̵�
x181002_g_YuanBaoIntro	= 18	--Ԫ������

--**********************************
--�¼��������
--**********************************
function x181002_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "    ������һ������ȫ���������Ʒ������˵ļ۸񣬿͹����Ͻ��������ɣ����Գ�ֵ���������ȥ���ҹ���ζ���Ц��~"
		AddText( sceneId, strText )
		--AddNumText( sceneId, x181002_g_scriptId, "����������Ʒ", 7, x181002_g_goodact)
		--AddNumText( sceneId, x181002_g_scriptId, "Ԫ������", 11, x181002_g_YuanBaoIntro)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x181002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x181002_g_goodact then
	--�µ�Ԫ���̵�
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, 1)
			UICommand_AddInt( sceneId, 2 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 888902)
	elseif GetNumText() == x181002_g_YuanBaoIntro	then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--�����������̵꣬��Ϊ�����̵��NPC�̵�
--**********************************
function x181002_NewDispatchShopItem(sceneId,selfId,targetId,shopId)
	if targetId >= 0 then
		DispatchShopItem( sceneId, selfId,targetId, shopId )
	else
		DispatchNoNpcShopItem( sceneId, selfId, shopId )
	end
end
