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