--�̵�
--�����̵�
--�䵱 ����

--�ű���
x701608_g_ScriptId = 701608

--�̵��
x701608_g_shoptableindex=54

--�̵�����
x701608_g_ShopName = "���������䷽"

--**********************************
--������ں���
--**********************************
function x701608_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId,targetId, x701608_g_shoptableindex )
end

--**********************************
--�о��¼�
--**********************************
function x701608_OnEnumerate( sceneId, selfId, targetId )
	--�ж��Ƿ��Ǳ��ɵ���
	if GetMenPai(sceneId,selfId) == MP_WUDANG then
		AddNumText(sceneId,x701608_g_ScriptId,x701608_g_ShopName,7,-1)
    end
	return
end

--**********************************
--����������
--**********************************
function x701608_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701608_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701608_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701608_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x701608_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x701608_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x701608_OnKillObject( sceneId, selfId, objdataId,objId)
end

--**********************************
--���������¼�
--**********************************
function x701608_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x701608_OnItemChanged( sceneId, selfId, itemdataId )
end
