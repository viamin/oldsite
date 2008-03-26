function checkResponse(form) {
	selection = form.elements[3].value;
	items = document.getElementsByName('bartkat');
	if (selection == "No") {
		for (var anchor = 0; anchor < items.length; anchor++) {
			var item = items[anchor];
			item.style.display = 'none';
		}
	} else {
		for (var anchor = 0; anchor < items.length; anchor++) {
			var item = items[anchor];
			item.style.display = '';
		}
	}
}

function checkValid() {
	errorDiv = document.getElementById('errorExplanation');
	if (errorDiv != null) {
		response = document.getElementById('invitee_response');
		if (response.value == "Yes") {
			items = document.getElementsByName('bartkat');
			for (var anchor = 0; anchor < items.length; anchor++) {
				var item = items[anchor];
				item.style.display = '';
			}
		}
	}
}

function updateCost() {
	baseCost = document.getElementById('rate');
	costDollar = parseInt(baseCost.innerHTML.substring(1));
	nights = document.getElementById('room_nights');
	roomNights = parseInt(nights.value);
	costP = document.getElementById('total_cost');
	peeps = document.getElementById('room_occupants');
	numPeeps = parseInt(peeps.value);
	totalCost = (costDollar * roomNights) + (8 * numPeeps);
	costP.innerHTML = "$" + totalCost;
}