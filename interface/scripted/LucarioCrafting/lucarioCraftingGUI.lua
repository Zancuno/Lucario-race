require "/scripts/util.lua"
require "/scripts/interp.lua"

function init()
	self.itemList = "itemScrollArea.itemList"

	config.getParameter("bodyType")
	
	self.itemGenderExtra = root.itemHasTag("GLU") or root.itemHasTag("LTU") or root.itemHasTag("RTU") or root.itemHasTag("FTU")
	self.itemNeutralExtra = root.itemHasTag("NLU") or root.itemHasTag("LTUN") or root.itemHasTag("RTUN") or root.itemHasTag("FTUN")

	self.itemGFull = root.itemHasTag("GCU") or self.itemGenderExtra
	self.itemGNS = root.itemHasTag("GCNSU") or self.itemGenderExtra
	self.itemGNPS = root.itemHasTag("GCNPSU") or self.itemGenderExtra
	self.itemGBare = root.itemHasTag("GCNSNPSU") or self.itemGenderExtra
	self.itemNFull = root.itemHasTag("NCU") or self.itemNeutralExtra
	self.itemNNS = root.itemHasTag("NCNSU") or self.itemNeutralExtra
	self.itemNNPS = root.itemHasTag("NCNPSU") or self.itemNeutralExtra
	self.itemNBare = root.itemHasTag("NCNSNPSU") or self.itemNeutralExtra
	
	self.itemBodyList = {}
	
	widget.setChecked("chkBoxChestSpike", false)
	widget.setChecked("chkBoxPawSpike", false)
	widget.setChecked("chkBoxNoSpike", false)
	widget.setChecked("chkBoxNoPawSpike", false)
	
	populateItemList()
end

function update(dt)
	populateItemList()
end

function setChkBoxChestSpike(widgetName)
	local widget.getChecked(widgetName)
end

function setChkBoxPawSpike(widgetName)
	local widget.getChecked(widgetName)
end

function setChkBoxNoSpike(widgetName)
	local widget.getChecked(widgetName)
end

function setChkBoxNoPawSpike(widgetName)
	local widget.getChecked(widgetName)
end

function populateItemList(forceRepop)
	local self.widgetCheck1 = widget.getChecked("chkBoxChestSpike") true
	local self.widgetCheck2 = widget.getChecked("chkBoxNoSpike") true
	local self.widgetCheck3 = widget.getChecked("chkBoxPawSpike") true
	local self.widgetCheck4 = widget.getChecked("chkBoxPawSpike") true

	local self.spiked = self.widgetCheck1 and self.widgetCheck3
	local self.noSpike = self.widgetCheck2 and self.widgetCheck3
	local self.noPawSpike = self.widgetCheck1 and self.widgetCheck4
	local self.bare = self.widgetCheck2 and self.widgetCheck4
	
	local self.optionGCU = widget.getSelectedOption(data.filter, "GCU") true
	local self.optionNCU = widget.getSelectedOption(data.filter, "NCU") true
	
	if self.optionGCU and self.spiked then
		local self.itemBodyList = self.itemGFull
		widget.setListSelected(self.itemList, self.itemBodyList)
		sb.logInfo("The List is currently set to show Fully Spiked Gender Lucario.")
		
	else if self.optionGCU and self.noSpike then
		local self.itemBodyList = self.itemGNS
		widget.setListSelected(self.itemList, self.itemBodyList)
		sb.logInfo("The List is currently set to show Gender Lucario without a chest spike.")
		
	else if self.optionGCU and self.noPawSpike then
		local self.itemBodyList = self.itemGNPS
		widget.setListSelected(self.itemList, self.itemBodyList)
		sb.logInfo("The List is currently set to show Gender Lucario without paw spikes.")
		
	else if self.optionGCU and self.bare then
		local self.itemBodyList = self.itemGBare
		widget.setListSelected(self.itemList, self.itemBodyList)
		sb.logInfo("The List is currrntly set to show Fully Bare Gender Lucario.")
		
	else sb.logInfo("The List is not currently selected for Gendered bodies or is broken") return
	end
	
	if self.optionNCU and self.spiked then
		local self.itemBodyList = self.itemGFull
		widget.setListSelected(self.itemList, self.itemBodyList)
		sb.logInfo("The List is currently set to show Fully Spiked Neutral Lucario.")
		
	else if self.optionNCUe and self.noSpike then
		local self.itemBodyList = self.itemGNS
		widget.setListSelected(self.itemList, self.itemBodyList)
		sb.logInfo("The List is currently set to show Neutral Lucario without a chest spike.")
		
	else if self.optionNCU and self.noPawSpike then
		local self.itemBodyList = self.itemGNPS
		widget.setListSelected(self.itemList, self.itemBodyList)
		sb.logInfo("The List is currently set to show Neutral Lucario without paw spikes.")
		
	else if self.optionNCU and self.bare then
		local self.itemBodyList = self.itemGBare
		widget.setListSelected(self.itemList, self.itemBodyList)
		sb.logInfo("The List is currrntly set to show Fully Bare Neutral Lucario.")
		
	else sb.logInfo("The List is not currently selected for Neutral bodies or is broken") return
	end	
	
end

