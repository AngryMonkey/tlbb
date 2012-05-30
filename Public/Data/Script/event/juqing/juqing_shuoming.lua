-- 200100
-- 剧情循环任务的说明

x200100_g_ScriptId = 200100
x200100_g_Info = {	
		{name="木婉清",  mis=8,s1="#{help_JQXH_001}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}", s4="#{help_JQXH_018}"},
		{name="钟灵",    mis=8,s1="#{help_JQXH_002}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}", s4="#{help_JQXH_031}"},
		{name="段延庆",  mis=8,s1="#{help_JQXH_003}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}", s4="#{help_JQXH_032}"},
		{name="鸠摩智",  mis=37,s1="#{help_JQXH_004}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}",s4="#{help_JQXH_040}"},
		{name="阮星竹",  mis=15,s1="#{help_JQXH_005}" ,s2="#{help_JQXH_020}",s3="#{help_JQXH_021}",s4="#{help_JQXH_034}"},
		{name="阿碧",    mis=15,s1="#{help_JQXH_006}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}",s4="#{help_JQXH_035}"},
		{name="王夫人",  mis=15,s1="#{help_JQXH_007}" ,s2="#{help_JQXH_022}",s3="#{help_JQXH_023}",s4="#{help_JQXH_036}"},
		{name="阿紫",    mis=32,s1="#{help_JQXH_008}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}",s4="#{help_JQXH_037}"},
		{name="赫连铁树",mis=45,s1="#{help_JQXH_009}" ,s2="#{help_JQXH_024}",s3="#{help_JQXH_025}",s4="#{help_JQXH_041}"},
		{name="慕容复",  mis=37,s1="#{help_JQXH_010}" ,s2="#{help_JQXH_014}",s3="#{help_JQXH_016}",s4="#{help_JQXH_038}"},
		{name="段正淳",  mis=8,s1="#{help_JQXH_011}" ,s2="#{help_JQXH_026}",s3="#{help_JQXH_027}", s4="#{help_JQXH_033}"},
		{name="耶律大石",mis=23,s1="#{help_JQXH_012}" ,s2="#{help_JQXH_015}",s3="#{help_JQXH_017}",s4="#{help_JQXH_019}"},
		{name="叶二娘",  mis=37,s1="#{help_JQXH_013}" ,s2="#{help_JQXH_028}",s3="#{help_JQXH_029}",s4="#{help_JQXH_039}"}
}
--木婉清			大理     
--钟灵        无量山   
--段延庆      大理 
--鸠摩智      敦煌     
--阮星竹      镜湖 
--阿碧        苏州     
--王夫人      苏州   
--阿紫        洛阳     
--赫连铁树    洛阳  
--慕容复      苏州     
--段正淳      大理  
--耶律大石    洛阳     
--叶二娘      大理     

--（万劫）20级开始的NPC 8 ：木婉清、钟灵、段延庆、段誉（段正淳）
--（燕子）30级开始的NPC 15：阿朱（阮星竹）、阿碧、王语嫣（王夫人）
--（聚贤）40级开始的NPC 23：萧峰（耶律大石）
--（苍茫）50级开始的NPC 32：阿紫
--（擂鼓）60级开始的NPC 37：慕容复、虚竹（叶二娘）、鸠摩智
--（一品）70级开始的NPC 45：银川公主（赫连铁树）

--**********************************
--列举事件
--**********************************
function x200100_OnEnumerate( sceneId, selfId, targetId )

	AddNumText(sceneId, x200100_g_ScriptId,"我是谁？",8,1);
	
	-- 玩家完成相关剧情任务后，才能看见这个选项
	local szNpcName = GetName(sceneId, targetId)
	local nIndex = 0
	for i=1,13   do
		if szNpcName == x200100_g_Info[i].name   then
			nIndex = i
		end
	end
	
	if (IsMissionHaveDone(sceneId,selfId,x200100_g_Info[nIndex].mis) > 0 ) then
		AddNumText(sceneId, x200100_g_ScriptId,"什么是剧情循环任务",11,2);
		AddNumText(sceneId, x200100_g_ScriptId,"什么是关系值",11,3);
	  AddNumText(sceneId, x200100_g_ScriptId,"#{help_JQXH_030}",11,4);
	end
	
	if (GetLevel(sceneId, selfId) >= 20) then
		AddNumText(sceneId, x200100_g_ScriptId,"#{AQFC_090115_12}",11,5);	  
	end
	
end

--**********************************
--任务入口函数
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
				AddText( sceneId, "#Y我是谁？" )
				AddText( sceneId, x200100_g_Info[nIndex].s1 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
				
	elseif GetNumText() == 2  then
		if nIndex > 0  then
			BeginEvent( sceneId )
				AddText( sceneId, "#Y什么是剧情循环任务？" )
				AddText( sceneId, x200100_g_Info[nIndex].s3 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	
	elseif GetNumText() == 3  then
		if nIndex > 0  then
			BeginEvent( sceneId )
				AddText( sceneId, "#Y什么是关系值？" )
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
