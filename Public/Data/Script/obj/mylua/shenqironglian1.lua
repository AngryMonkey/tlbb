--����NPC
--�齱
--��ͨ
x889063_g_strGongGaoInfo = {
  "#e6f00c7#b#{_INFOUSR%s}#H����һ��Ŭ���������ռ�ȫ�˺ϳ�����������Ҫ����Ʒ��������#Y��������ʹ��#W�����͸���һ��#{_INFOMSG%s}��", 
  "#e0ba4b6#u#{_INFOUSR%s} #cff99ccΪ#G����#Y��������ʹ��#cff99cc������#Y������������#cff99cc����������ʹ������#{_INFOMSG%s}��Ϊ��л��", 
  "#effc9d8#cf30768#b#{_INFOUSR%s}#H����������ʹ�ߴ�����#R��������#I�������У�һ·����ն���������ǹ��򲻸�������,������#{_INFOMSG%s}��",
  "#e0e8de5#Y#u#{_INFOUSR%s}#H������иŬ���ռ�����#R������������#I��������Ʒ�����#W#{_INFOMSG%s}#H������������Ľ����", 
}
--**********************************
--�¼��������
--**********************************
function x889063_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "#c0066ff������������ƽ̨" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV1-LV2#G��#cFF0000һ����������#Y50��" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV2-LV3#G��#cFF0000������������#Y50��" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV3-LV4#G��#cFF0000������������#Y100��" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV4-LV5#G��#cFF0000������������#Y100��#W��#cFF0000������#Y100����" )
		AddText( sceneId, "#cff99ff��ʾ��#G���������Ƕ�ı�ʯ#cff99ff��" )
		AddNumText( sceneId, x889063_g_ScriptId, "��������#G��#cFF0000LV1-LV5#G��#cFF000020%��", 5, 100 )
		AddNumText( sceneId, x889063_g_ScriptId, "����״̬#G��#cFF0000��������#G��#cFF0000��ȡ��", 5, 200 )
		AddNumText( sceneId, x889063_g_ScriptId, "��������#G��#cFF0000��ϸ����#G��#cFF0000��", 5, 400 )
		AddNumText( sceneId, x889063_g_ScriptId, "�´�����", 5, 4 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x889063_OnEventRequest( sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent( sceneId )
		      AddText( sceneId, "����������Ҫ���ģ�" )
		      AddText( sceneId, "#G���Ӧ������#W1#G��" )
		      AddText( sceneId, "#cff99ff��������#W����#cff99ff��" )
		      AddText( sceneId, "#G��ȷ��Ҫ������" )
		      AddText( sceneId, "#c0066ff��������#W������#Y����BOSS��#W���!" )
		      AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV1-LV2#G��#cFF0000һ����������#Y50��" )
		      AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV2-LV3#G��#cFF0000������������#Y50��" )
		      AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV3-LV4#G��#cFF0000������������#Y100��" )
		      AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV4-LV5#G��#cFF0000������������#Y100��#W��#cFF0000������#Y50����" )
			AddNumText( sceneId, x889063_g_scriptId, "��������#G��#cFF0000LV1-LV2#G��#cFF000020%��", 5, 101)
			AddNumText( sceneId, x889063_g_scriptId, "��������#G��#cFF0000LV2-LV3#G��#cFF000020%��", 5, 102)
			AddNumText( sceneId, x889063_g_scriptId, "��������#G��#cFF0000LV3-LV4#G��#cFF000020%��", 5, 103)
			AddNumText( sceneId, x889063_g_scriptId, "��������#G��#cFF0000LV4-LV5#G��#cFF000020%��", 5, 104)

			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 101 then
		BeginEvent( sceneId )
		      AddText( sceneId, "����������Ҫ���ģ�" )
		      AddText( sceneId, "#G���Ӧ������#W1#G��" )
		      AddText( sceneId, "#cff99ff��������#W����#cff99ff��" )
		      AddText( sceneId, "#c0066ff��������#W������#Y����BOSS��#W���!" )
		      AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV1-LV2#G��#cFF0000һ����������#Y50��" )
		      AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV2-LV3#G��#cFF0000������������#Y50��" )
		      AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV3-LV4#G��#cFF0000������������#Y100��" )
		      AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV4-LV5#G��#cFF0000������������#Y100��#W��#cFF0000������#Y50����" )
			AddNumText( sceneId, x889063_g_scriptId, "������Ƶ�#G��#cFF0000LV1-LV2#G��#cFF000020%��", 5, 1011)
			AddNumText( sceneId, x889063_g_scriptId, "ն�Ƕϳ�ǹ#G��#cFF0000LV1-LV2#G��#cFF000020%��", 5, 1012)
			AddNumText( sceneId, x889063_g_scriptId, "������Ԩ��#G��#cFF0000LV1-LV2#G��#cFF000020%��", 5, 1013)
			AddNumText( sceneId, x889063_g_scriptId, "ת�����ǹ�#G��#cFF0000LV1-LV2#G��#cFF000020%��", 5, 1014)
			AddNumText( sceneId, x889063_g_scriptId, "���������#G��#cFF0000LV1-LV2#G��#cFF000020%��", 5, 1015)
			AddNumText( sceneId, x889063_g_scriptId, "������Ӱ��#G��#cFF0000LV1-LV2#G��#cFF000020%��", 5, 1016)
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1011 then
	       	local nStoneId0 = 10300008
	       	local nStoneId1 = 30503089
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300008,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503089,50)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300009, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1012 then
	       	local nStoneId0 = 10301002
	       	local nStoneId1 = 30503089
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301002,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503089,50)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301003, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1013 then
	       	local nStoneId0 = 10302010
	       	local nStoneId1 = 30503089
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302010,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503089,50)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302011, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1014 then
	       	local nStoneId0 = 10303002
	       	local nStoneId1 = 30503089
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303002,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503089,50)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303003, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1015 then
	       	local nStoneId0 = 10304010
	       	local nStoneId1 = 30503089
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304010,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503089,50)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304011, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1016 then
	       	local nStoneId0 = 10305010
	       	local nStoneId1 = 30503089
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305010,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503089,50)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305011, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 102 then
		BeginEvent( sceneId )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV1-LV2#G��#cFF0000һ����������#Y50��" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV2-LV3#G��#cFF0000������������#Y50��" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV3-LV4#G��#cFF0000������������#Y100��" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV4-LV5#G��#cFF0000������������#Y100��#W��#cFF0000������#Y50����" )
			AddNumText( sceneId, x889063_g_scriptId, "������Ƶ�#G��#cFF0000LV2-LV3#G��#cFF000020%��", 5, 1021)
			AddNumText( sceneId, x889063_g_scriptId, "ն�Ƕϳ�ǹ#G��#cFF0000LV2-LV3#G��#cFF000020%��", 5, 1022)
			AddNumText( sceneId, x889063_g_scriptId, "������Ԩ��#G��#cFF0000LV2-LV3#G��#cFF000020%��", 5, 1023)
			AddNumText( sceneId, x889063_g_scriptId, "ת�����ǹ�#G��#cFF0000LV2-LV3#G��#cFF000020%��", 5, 1024)
			AddNumText( sceneId, x889063_g_scriptId, "���������#G��#cFF0000LV2-LV3#G��#cFF000020%��", 5, 1025)
			AddNumText( sceneId, x889063_g_scriptId, "������Ӱ��#G��#cFF0000LV2-LV3#G��#cFF000020%��", 5, 1026)
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1021 then
	       	local nStoneId0 = 10300009
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300009,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,50)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300010, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1022 then
	       	local nStoneId0 = 10301003
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301003,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,50)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301004, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1023 then
	       	local nStoneId0 = 10302011
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302011,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,50)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302012, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1024 then
	       	local nStoneId0 = 10303003
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303003,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,50)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303004, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1025 then
	       	local nStoneId0 = 10304011
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304011,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,50)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304012, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1026 then
	       	local nStoneId0 = 10305011
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305011,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,50)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305012, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 103 then
		BeginEvent( sceneId )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV1-LV2#G��#cFF0000һ����������#Y50��" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV2-LV3#G��#cFF0000������������#Y50��" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV3-LV4#G��#cFF0000������������#Y100��" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV4-LV5#G��#cFF0000������������#Y100��#W��#cFF0000������#Y50����" )
			AddNumText( sceneId, x889063_g_scriptId, "������Ƶ�#G��#cFF0000LV3-LV4#G��#cFF000020%��", 5, 1031)
			AddNumText( sceneId, x889063_g_scriptId, "ն�Ƕϳ�ǹ#G��#cFF0000LV3-LV4#G��#cFF000020%��", 5, 1032)
			AddNumText( sceneId, x889063_g_scriptId, "������Ԩ��#G��#cFF0000LV3-LV4#G��#cFF000020%��", 5, 1033)
			AddNumText( sceneId, x889063_g_scriptId, "ת�����ǹ�#G��#cFF0000LV3-LV4#G��#cFF000020%��", 5, 1034)
			AddNumText( sceneId, x889063_g_scriptId, "���������#G��#cFF0000LV3-LV4#G��#cFF000020%��", 5, 1035)
			AddNumText( sceneId, x889063_g_scriptId, "������Ӱ��#G��#cFF0000LV3-LV4#G��#cFF000020%��", 5, 1036)
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1031 then
	       	local nStoneId0 = 10300010
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300010,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300011, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1032 then
	       	local nStoneId0 = 10301004
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301004,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--ɾ����Ʒ
	                           local bagpos01 = TryRecieveItem( sceneId, selfId, 10301005, 1 )	-- �Ų��¾�û����
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1033 then
	       	local nStoneId0 = 10302012
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302012,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302013, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1034 then
	       	local nStoneId0 = 10303004
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303004,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303005, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1035 then
	       	local nStoneId0 = 10304012
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304012,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304013, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1036 then
	       	local nStoneId0 = 10305012
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305012,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305013, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 104 then
		BeginEvent( sceneId )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV1-LV2#G��#cFF0000һ����������#Y50��" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV2-LV3#G��#cFF0000������������#Y50��" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV3-LV4#G��#cFF0000������������#Y100��" )
		AddText( sceneId, "#c0066ff����#W��#G��#cFF0000LV4-LV5#G��#cFF0000������������#Y100��#W��#cFF0000������#Y50����" )
			AddNumText( sceneId, x889063_g_scriptId, "������Ƶ�#G��#cFF0000LV4-LV5#G��#cFF000020%��", 5, 1041)
			AddNumText( sceneId, x889063_g_scriptId, "ն�Ƕϳ�ǹ#G��#cFF0000LV4-LV5#G��#cFF000020%��", 5, 1042)
			AddNumText( sceneId, x889063_g_scriptId, "������Ԩ��#G��#cFF0000LV4-LV5#G��#cFF000020%��", 5, 1043)
			AddNumText( sceneId, x889063_g_scriptId, "ת�����ǹ�#G��#cFF0000LV4-LV5#G��#cFF000020%��", 5, 1044)
			AddNumText( sceneId, x889063_g_scriptId, "���������#G��#cFF0000LV4-LV5#G��#cFF000020%��", 5, 1045)
			AddNumText( sceneId, x889063_g_scriptId, "������Ӱ��#G��#cFF0000LV4-LV5#G��#cFF000020%��", 5, 1046)
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1041 then
	       	local nStoneId0 = 10300011
	       	local nStoneId1 = 30503091
	       	local nStoneId2 = 30501173
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId2)
            if c0 >=1 and c1 >=100 and c2 >=100 then
				BeginEvent( sceneId ) 
		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10300011,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,100)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30501173,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300012, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[ϵͳ]:#G�������,��ϲ#{_INFOUSR%s}������������������,ȡ���ռ���Ʒ#{_INFOMSG%s}!���������Դ���ǿ,���ǾӼ�����,PKɱ�˵ıر�Ŷ~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1042 then
	       	local nStoneId0 = 10301005
	       	local nStoneId1 = 30503091
	       	local nStoneId2 = 30501173
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId2)
            if c0 >=1 and c1 >=100 and c2 >=100 then
				BeginEvent( sceneId ) 
		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10301005,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,100)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30501173,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301006, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[ϵͳ]:#G�������,��ϲ#{_INFOUSR%s}������������������,ȡ���ռ���Ʒ#{_INFOMSG%s}!���������Դ���ǿ,���ǾӼ�����,PKɱ�˵ıر�Ŷ~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1043 then
	       	local nStoneId0 = 10302013
	       	local nStoneId1 = 30503091
	       	local nStoneId2 = 30501173
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId2)
            if c0 >=1 and c1 >=100 and c2 >=100 then
				BeginEvent( sceneId ) 
		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10302013,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,100)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30501173,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302014, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[ϵͳ]:#G�������,��ϲ#{_INFOUSR%s}������������������,ȡ���ռ���Ʒ#{_INFOMSG%s}!���������Դ���ǿ,���ǾӼ�����,PKɱ�˵ıر�Ŷ~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1044 then
	       	local nStoneId0 = 10303005
	       	local nStoneId1 = 30503091
	       	local nStoneId2 = 30501173
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId2)
            if c0 >=1 and c1 >=100 and c2 >=100 then
				BeginEvent( sceneId ) 
		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10303005,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,100)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30501173,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303006, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[ϵͳ]:#G�������,��ϲ#{_INFOUSR%s}������������������,ȡ���ռ���Ʒ#{_INFOMSG%s}!���������Դ���ǿ,���ǾӼ�����,PKɱ�˵ıر�Ŷ~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1045 then
	       	local nStoneId0 = 10304013
	       	local nStoneId1 = 30503091
	       	local nStoneId2 = 30501173
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId2)
            if c0 >=1 and c1 >=100 and c2 >=100 then
				BeginEvent( sceneId )
		                    local playername = GetName(sceneId, selfId) 
					LuaFnDelAvailableItem(sceneId,selfId,10304013,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,100)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30501173,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304014, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[ϵͳ]:#G�������,��ϲ#{_INFOUSR%s}������������������,ȡ���ռ���Ʒ#{_INFOMSG%s}!���������Դ���ǿ,���ǾӼ�����,PKɱ�˵ıر�Ŷ~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1046 then
	       	local nStoneId0 = 10305013
	       	local nStoneId1 = 30503091
	       	local nStoneId2 = 30501173
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId2)
            if c0 >=1 and c1 >=100 and c2 >=100 then
				BeginEvent( sceneId )
		                    local playername = GetName(sceneId, selfId) 
					LuaFnDelAvailableItem(sceneId,selfId,10305013,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503091,100)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30501173,100)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305014, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[ϵͳ]:#G�������,��ϲ#{_INFOUSR%s}������������������,ȡ���ռ���Ʒ#{_INFOMSG%s}!���������Դ���ǿ,���ǾӼ�����,PKɱ�˵ıر�Ŷ~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 200 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����״̬#Wӵ��#Y�������м���#W����Ч��!" )
		      AddText( sceneId, "��ȡ���ܱ��������Ӧ��������" )
		      AddText( sceneId, "#G��ȷ��Ҫ��ȡ��" )
			AddNumText( sceneId, x889063_g_scriptId, "��ȡ#cFF0000������Ƶ�#Y״̬", 5, 201)
			AddNumText( sceneId, x889063_g_scriptId, "��ȡ#cFF0000ն�Ƕϳ�ǹ#Y״̬", 5, 202)
			AddNumText( sceneId, x889063_g_scriptId, "��ȡ#cFF0000������Ԩ��#Y״̬", 5, 203)
			AddNumText( sceneId, x889063_g_scriptId, "��ȡ#cFF0000ת�����ǹ�#Y״̬", 5, 204)
			AddNumText( sceneId, x889063_g_scriptId, "��ȡ#cFF0000���������#Y״̬", 5, 205)
			AddNumText( sceneId, x889063_g_scriptId, "��ȡ#cFF0000������Ӱ��#Y״̬", 5, 206)

			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 201 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����״̬#Wӵ��#Y�������м���#W����Ч��!" )
		      AddText( sceneId, "��ȡ���ܱ��������Ӧ��������" )
		      AddText( sceneId, "#G��ȷ��Ҫ��ȡ��" )
			AddNumText( sceneId, x889063_g_scriptId, "#W������Ƶ���#cFF00002%��", 5, 2011)
			AddNumText( sceneId, x889063_g_scriptId, "#Y������Ƶ���#cFF00005%��", 5, 2012)
			AddNumText( sceneId, x889063_g_scriptId, "#G������Ƶ���#cFF00008%��", 5, 2013)
			AddNumText( sceneId, x889063_g_scriptId, "#c009933������Ƶ���#cFF000011%��", 5, 2014)
			AddNumText( sceneId, x889063_g_scriptId, "#cFF0000������Ƶ���#gf00ff015%��", 5, 2015)
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2011 then
	   if GetItemCount(sceneId, selfId, 10300008) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9575, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end
	elseif GetNumText() == 2012 then
	   if GetItemCount(sceneId, selfId, 10300009) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9576, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end
	elseif GetNumText() == 2013 then
	   if GetItemCount(sceneId, selfId, 10300010) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9577, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2014 then
	   if GetItemCount(sceneId, selfId, 10300011) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9578, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2015 then
	   if GetItemCount(sceneId, selfId, 10300012) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9579, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2016 then
	       	local nStoneId0 = 10451232
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10451232,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10451233, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 202 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����״̬#Wӵ��#Y�������м���#W����Ч��!" )
		      AddText( sceneId, "��ȡ���ܱ��������Ӧ��������" )
		      AddText( sceneId, "#G��ȷ��Ҫ��ȡ��" )
			AddNumText( sceneId, x889063_g_scriptId, "#Wն�Ƕϳ�ǹ��#cFF00002%��", 5, 2021)
			AddNumText( sceneId, x889063_g_scriptId, "#Yն�Ƕϳ�ǹ��#cFF00005%��", 5, 2022)
			AddNumText( sceneId, x889063_g_scriptId, "#Gն�Ƕϳ�ǹ��#cFF00008%��", 5, 2023)
			AddNumText( sceneId, x889063_g_scriptId, "#c009933ն�Ƕϳ�ǹ��#cFF000011%��", 5, 2024)
			AddNumText( sceneId, x889063_g_scriptId, "#cFF0000ն�Ƕϳ�ǹ��#cFF000015%��", 5, 2025)
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif GetNumText() == 2021 then
	   if GetItemCount(sceneId, selfId, 10301002) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9590, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2022 then
	   if GetItemCount(sceneId, selfId, 10301003) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9591, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2023 then
	   if GetItemCount(sceneId, selfId, 10301004) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9592, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2024 then
	   if GetItemCount(sceneId, selfId, 10301005) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9596, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2025 then
	   if GetItemCount(sceneId, selfId, 10301006) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9594, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2026 then
	       	local nStoneId0 = 10451233
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10451233,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10451234, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 203 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����״̬#Wӵ��#Y�������м���#W����Ч��!" )
		      AddText( sceneId, "��ȡ���ܱ��������Ӧ��������" )
		      AddText( sceneId, "#G��ȷ��Ҫ��ȡ��" )
			AddNumText( sceneId, x889063_g_scriptId, "#W������Ԩ����#cFF00002%��", 5, 2031)
			AddNumText( sceneId, x889063_g_scriptId, "#Y������Ԩ����#cFF00005%��", 5, 2032)
			AddNumText( sceneId, x889063_g_scriptId, "#G������Ԩ����#cFF00008%��", 5, 2033)
			AddNumText( sceneId, x889063_g_scriptId, "#c009933������Ԩ����#cFF000011%��", 5, 2034)
			AddNumText( sceneId, x889063_g_scriptId, "#cFF0000������Ԩ����#cFF000015%��", 5, 2035)
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2031 then
	   if GetItemCount(sceneId, selfId, 10302010) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9570, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2032 then
	   if GetItemCount(sceneId, selfId, 10302011) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9571, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2033 then
	   if GetItemCount(sceneId, selfId, 10302012) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9572, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2034 then
	   if GetItemCount(sceneId, selfId, 10302013) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9573, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2035 then
	   if GetItemCount(sceneId, selfId, 10302014) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9574, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2036 then
	       	local nStoneId0 = 10451234
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10451234,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10451235, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 204 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����״̬#Wӵ��#Y�������м���#W����Ч��!" )
		      AddText( sceneId, "��ȡ���ܱ��������Ӧ��������" )
		      AddText( sceneId, "#G��ȷ��Ҫ��ȡ��" )
			AddNumText( sceneId, x889063_g_scriptId, "#Wת�����ǹ���#cFF00002%��", 5, 2041)
			AddNumText( sceneId, x889063_g_scriptId, "#Yת�����ǹ���#cFF00005%��", 5, 2042)
			AddNumText( sceneId, x889063_g_scriptId, "#Gת�����ǹ���#cFF00008%��", 5, 2043)
			AddNumText( sceneId, x889063_g_scriptId, "#c009933ת�����ǹ���#cFF000011%��", 5, 2044)
			AddNumText( sceneId, x889063_g_scriptId, "#cFF0000ת�����ǹ���#cFF000015%��", 5, 2045)
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2041 then
	   if GetItemCount(sceneId, selfId, 10303002) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9595, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2042 then
	   if GetItemCount(sceneId, selfId, 10303003) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9596, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2043 then
	   if GetItemCount(sceneId, selfId, 10303004) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9597, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2044 then
	   if GetItemCount(sceneId, selfId, 10303005) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9598, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2045 then
	   if GetItemCount(sceneId, selfId, 10303006) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9599, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2046 then
	       	local nStoneId0 = 10451235
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10451235,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10451236, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 205 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����״̬#Wӵ��#Y�������м���#W����Ч��!" )
		      AddText( sceneId, "��ȡ���ܱ��������Ӧ��������" )
		      AddText( sceneId, "#G��ȷ��Ҫ��ȡ��" )
			AddNumText( sceneId, x889063_g_scriptId, "#W��������Ȣ�#cFF00002%��", 5, 2051)
			AddNumText( sceneId, x889063_g_scriptId, "#Y��������Ȣ�#cFF00005%��", 5, 2052)
			AddNumText( sceneId, x889063_g_scriptId, "#G��������Ȣ�#cFF00008%��", 5, 2053)
			AddNumText( sceneId, x889063_g_scriptId, "#c009933��������Ȣ�#cFF000011%��", 5, 2054)
			AddNumText( sceneId, x889063_g_scriptId, "#cFF0000��������Ȣ�#cFF000015%��", 5, 2055)
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2051 then
	   if GetItemCount(sceneId, selfId, 10304010) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9580, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2052 then
	   if GetItemCount(sceneId, selfId, 10304011) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9581, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2053 then
	   if GetItemCount(sceneId, selfId, 10304012) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9582, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2054 then
	   if GetItemCount(sceneId, selfId, 10304013) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9583, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2055 then
	   if GetItemCount(sceneId, selfId, 10304014) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9584, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2056 then
	       	local nStoneId0 = 10451236
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10451236,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10451237, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 206 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff����״̬#Wӵ��#Y�������м���#W����Ч��!" )
		      AddText( sceneId, "��ȡ���ܱ��������Ӧ��������" )
		      AddText( sceneId, "#G��ȷ��Ҫ��ȡ��" )
			AddNumText( sceneId, x889063_g_scriptId, "#W������Ӱ����#cFF00002%��", 5, 2061)
			AddNumText( sceneId, x889063_g_scriptId, "#Y������Ӱ����#cFF00005%��", 5, 2062)
			AddNumText( sceneId, x889063_g_scriptId, "#G������Ӱ����#cFF00008%��", 5, 2063)
			AddNumText( sceneId, x889063_g_scriptId, "#c009933������Ӱ����#cFF000011%��", 5, 2064)
			AddNumText( sceneId, x889063_g_scriptId, "#cFF0000������Ӱ����#cFF000015%��", 5, 2065)
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2061 then
	   if GetItemCount(sceneId, selfId, 10305010) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9585, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2062 then
	   if GetItemCount(sceneId, selfId, 10305011) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9586, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2063 then
	   if GetItemCount(sceneId, selfId, 10305012) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9587, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2064 then
	   if GetItemCount(sceneId, selfId, 10305013) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9588, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2065 then
	   if GetItemCount(sceneId, selfId, 10305014) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "�Բ��������߱�����״̬���ʸ�" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9589, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡ״̬" )
          end

	elseif GetNumText() == 2066 then
	       	local nStoneId0 = 10451237
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10451237,1)--ɾ����Ʒ
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--ɾ����Ʒ
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10451238, 1)--������Ʒ
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G��ϲ�㣬װ�������ɹ���"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G��Ĳ��ϲ������Ͳ�Ҫ�����ű�ʹ���ˣ�С���ұ���Ŷ����"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 400 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#cFF0000��������#WΪ�����ر�Ϊ��׼����#G�߼�װ��#W��#Y�߼�����#Wһ����Ϊ#cFF00005���ȼ�#W��ÿ����#Gһ���ȼ�#W����װ��#cFF0000��������20%#W���߼�����#Yӵ������������û�е�״̬�ʹ���!" )
		      AddText( sceneId, "#cFF0000�߼�������Դ#W��" )
		      AddText( sceneId, "#G1.#cFF0000��ȱ���������7����#Y��ȱ���������7��#W��ȡ��ʽ�͹ٷ���ͬ����#GƮ�츱��#cFF0000���һ��#Y����ˮ#W�������м��ʻ�ã�" )
		      AddText( sceneId, "#G2.#cFF0000��ç���7����#Y��ç���7��#W��ȡ��ʽ�͹ٷ���ͬ����#G��������#W��#G¥������#W���һ�����м��ʻ�á����#Y��ç���7����#W�����޸�#Y��ȱ���������7��#W������ɶ�#cFF0000100%#Wʱ�Ϳ���ұ�������ˡ�" )
		      AddText( sceneId, "#G3.#cFF0000�����䷽ͼ����#Y�����䷽ͼ��#W������#cFF0000����������#W��#GѪս�ľ�ׯ#W��#Y��ս����ɽ#W�ȸ����л�á���������䷽��ѧϰ����Я��#Y������#cFF0000�������7��#W��#Y����#Wƽ̨�����ռ�������" )
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )


	elseif GetNumText() == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
end
--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x889063_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x889063_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x889063_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x889063_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 4 )
	local str
	if nMsgIndex == 1 then
		str = format( x889063_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x889063_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	elseif nMsgIndex == 3 then
		str = format( x889063_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	else
		str = format( x889063_g_strGongGaoInfo[4], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
