--�̵�
--�����̵�
--��ɽ ������

--�ű���
x701612_g_ScriptId = 701612

--�̵��
x701612_g_shoptableindex=58

--�̵�����
x701612_g_ShopName = "�����������䷽"

--**********************************
--������ں���
--**********************************
function x701612_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId,targetId, x701612_g_shoptableindex )
end

--**********************************
--�о��¼�
--**********************************
function x701612_OnEnumerate( sceneId, selfId, targetId )
	--�ж��Ƿ��Ǳ��ɵ���
	if GetMenPai(sceneId,selfId) == MP_TIANSHAN then
		AddNumText(sceneId,x701612_g_ScriptId,x701612_g_ShopName,7,-1)
    end
	return
end

--**********************************
--����������
--**********************************
function x701612_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701612_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701612_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701612_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x701612_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x701612_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x701612_OnKillObject( sceneId, selfId, objdataId,objId)
end

--**********************************
--���������¼�
--**********************************
function x701612_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x701612_OnItemChanged( sceneId, selfId, itemdataId )
end
