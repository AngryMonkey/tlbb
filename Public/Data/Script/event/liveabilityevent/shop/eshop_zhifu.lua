--�̵�
--�����̵�
--���� �Ʒ�

--�ű���
x701609_g_ScriptId = 701609

--�̵��
x701609_g_shoptableindex=55

--�̵�����
x701609_g_ShopName = "�����Ʒ��䷽"

--**********************************
--������ں���
--**********************************
function x701609_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId,targetId, x701609_g_shoptableindex )
end

--**********************************
--�о��¼�
--**********************************
function x701609_OnEnumerate( sceneId, selfId, targetId )
	--�ж��Ƿ��Ǳ��ɵ���
	if GetMenPai(sceneId,selfId) == MP_EMEI then
		AddNumText(sceneId,x701609_g_ScriptId,x701609_g_ShopName,7,-1)
    end
	return
end

--**********************************
--����������
--**********************************
function x701609_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701609_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701609_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701609_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x701609_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x701609_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x701609_OnKillObject( sceneId, selfId, objdataId,objId)
end

--**********************************
--���������¼�
--**********************************
function x701609_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x701609_OnItemChanged( sceneId, selfId, itemdataId )
end
