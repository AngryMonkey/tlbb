
--��ȡ����ָ��
--MisDescBegin
--�ű���
x210240_g_ScriptId = 210240
--MisDescEnd

--**********************************
--������ں���
--**********************************
function x210240_OnDefaultEvent( sceneId, selfId, targetId )
   local WorldReferenceID = 30308021
   local bHave = HaveItem( sceneId, selfId, WorldReferenceID )
   
   if( bHave < 0 ) then
       bHave = HaveItemInBank( sceneId, selfId, WorldReferenceID )
   end
   
   if( 1 == bHave ) then
       --PrintStr( "Have" )
       BeginEvent( sceneId )
			    AddText( sceneId, "  �㲻���Ѿ���һ������ָ������" )
		   EndEvent( sceneId )
		   DispatchEventList( sceneId, selfId, targetId )
       
       return   
   end
      
   local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
   if( FreeSpace > 0 ) then
       --��ʣ��ռ�,���͸����һ������ָ��
       	BeginAddItem(sceneId)
	          AddItem( sceneId, WorldReferenceID, 1 )
	      EndAddItem(sceneId,selfId)
	      AddItemListToHuman(sceneId,selfId)
	      
	      --�رս���
				BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
				EndUICommand( sceneId )
				DispatchUICommand( sceneId, selfId, 1000 )
				
				--��ʾ��Ŀ��ʾ
			  BeginEvent(sceneId)
			      strText = "�������һ������ָ��"
			  AddText(sceneId,strText)
 		    EndEvent(sceneId)
 		    DispatchMissionTips(sceneId,selfId)
 		  
   else
       BeginEvent( sceneId )
			    AddText( sceneId, "  ���ı�������,��������λ�������Ұ�" )			
		   EndEvent( sceneId )
		   DispatchEventList( sceneId, selfId, targetId )
   end
   
end


--**********************************
--�о��¼�
--**********************************
function x210240_OnEnumerate( sceneId, selfId, targetId )
    AddNumText( sceneId, x210240_g_ScriptId, "��ȡ����ָ��", 11, 100 )
end

--**********************************
--����������
--**********************************
function x210240_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210240_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210240_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210240_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210240_CheckSubmit( sceneId, selfId )

end


--**********************************
--�ύ
--**********************************
function x210240_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x210240_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x210240_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210240_OnItemChanged( sceneId, selfId, itemdataId )
end







