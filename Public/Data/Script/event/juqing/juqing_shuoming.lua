-- 200100
-- ����ѭ�������˵��

x200100_g_ScriptId = 200100
x200100_g_Info = {	
		{name="ľ����",  mis=8,s1="#{help_JQXH_001}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}", s4="#{help_JQXH_018}"},
		{name="����",    mis=8,s1="#{help_JQXH_002}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}", s4="#{help_JQXH_031}"},
		{name="������",  mis=8,s1="#{help_JQXH_003}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}", s4="#{help_JQXH_032}"},
		{name="�Ħ��",  mis=37,s1="#{help_JQXH_004}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}",s4="#{help_JQXH_040}"},
		{name="������",  mis=15,s1="#{help_JQXH_005}" ,s2="#{help_JQXH_020}",s3="#{help_JQXH_021}",s4="#{help_JQXH_034}"},
		{name="����",    mis=15,s1="#{help_JQXH_006}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}",s4="#{help_JQXH_035}"},
		{name="������",  mis=15,s1="#{help_JQXH_007}" ,s2="#{help_JQXH_022}",s3="#{help_JQXH_023}",s4="#{help_JQXH_036}"},
		{name="����",    mis=32,s1="#{help_JQXH_008}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}",s4="#{help_JQXH_037}"},
		{name="��������",mis=45,s1="#{help_JQXH_009}" ,s2="#{help_JQXH_024}",s3="#{help_JQXH_025}",s4="#{help_JQXH_041}"},
		{name="Ľ�ݸ�",  mis=37,s1="#{help_JQXH_010}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}",s4="#{help_JQXH_038}"},
		{name="������",  mis=8,s1="#{help_JQXH_011}" ,s2="#{help_JQXH_026}",s3="#{help_JQXH_027}", s4="#{help_JQXH_033}"},
		{name="Ү�ɴ�ʯ",mis=23,s1="#{help_JQXH_012}" ,s2="#{help_JQXH_015}",s3="#{help_JQXH_017}",s4="#{help_JQXH_019}"},
		{name="Ҷ����",  mis=37,s1="#{help_JQXH_013}" ,s2="#{help_JQXH_028}",s3="#{help_JQXH_029}",s4="#{help_JQXH_039}"}
}
--ľ����			����     
--����        ����ɽ   
--������      ���� 
--�Ħ��      �ػ�     
--������      ���� 
--����        ����     
--������      ����   
--����        ����     
--��������    ����  
--Ľ�ݸ�      ����     
--������      ����  
--Ү�ɴ�ʯ    ����     
--Ҷ����      ����     

--����٣�20����ʼ��NPC 8 ��ľ���塢���顢�����졢��������������
--�����ӣ�30����ʼ��NPC 15�����죨�����񣩡����̡������̣������ˣ�
--�����ͣ�40����ʼ��NPC 23�����壨Ү�ɴ�ʯ��
--����ã��50����ʼ��NPC 32������
--���޹ģ�60����ʼ��NPC 37��Ľ�ݸ�������Ҷ������Ħ��
--��һƷ��70����ʼ��NPC 45����������������������

--**********************************
--�о��¼�
--**********************************
function x200100_OnEnumerate( sceneId, selfId, targetId )

	AddNumText(sceneId, x200100_g_ScriptId,"����˭��",8,1);
	
	-- ��������ؾ�������󣬲��ܿ������ѡ��
	local szNpcName = GetName(sceneId, targetId)
	local nIndex = 0
	for i=1,13   do
		if szNpcName == x200100_g_Info[i].name   then
			nIndex = i
		end
	end
	
	if (IsMissionHaveDone(sceneId,selfId,x200100_g_Info[nIndex].mis) > 0 ) then
		AddNumText(sceneId, x200100_g_ScriptId,"ʲô�Ǿ���ѭ������",11,2);
		AddNumText(sceneId, x200100_g_ScriptId,"ʲô�ǹ�ϵֵ",11,3);
	  AddNumText(sceneId, x200100_g_ScriptId,"#{help_JQXH_030}",11,4);
	end
	
	if (GetLevel(sceneId, selfId) >= 20) then
		AddNumText(sceneId, x200100_g_ScriptId,"#{AQFC_090115_12}",11,5);	  
	end
	
end

--**********************************
--������ں���
--**********************************
function x200100_OnDefaultEvent( sceneId, selfId, targetId )
	local szNpcName = GetName(sceneId, targetId)
	local nIndex = 0
	for i=1,13   do
		if szNpcName == x200100_g_Info[i].name   then
			nIndex = i
		end
	end
	
	if GetNumText() == 1  then
		if nIndex > 0  then
			BeginEvent( sceneId )
				AddText( sceneId, "#Y����˭��" )
				AddText( sceneId, x200100_g_Info[nIndex].s1 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
				
	elseif GetNumText() == 2  then
		if nIndex > 0  then
			BeginEvent( sceneId )
				AddText( sceneId, "#Yʲô�Ǿ���ѭ������" )
				AddText( sceneId, x200100_g_Info[nIndex].s3 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	
	elseif GetNumText() == 3  then
		if nIndex > 0  then
			BeginEvent( sceneId )
				AddText( sceneId, "#Yʲô�ǹ�ϵֵ��" )
				AddText( sceneId, x200100_g_Info[nIndex].s2 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
			
	elseif GetNumText() == 4  then
      if nIndex > 0  then
			BeginEvent( sceneId )
				AddText( sceneId, "#Y#{help_JQXH_030}" )
				AddText( sceneId, x200100_g_Info[nIndex].s4 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
  elseif GetNumText() == 5  then--[tx43452]
		BeginEvent( sceneId )
			AddText( sceneId, "#{AQFC_090115_12}" )
			AddText( sceneId, "#{AQFC_090115_15}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )--[/tx43452]				
	end
	
end
