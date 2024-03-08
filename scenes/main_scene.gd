extends Node2D
var news_blurbs = {
	"blurb_1": "Stardate: 71284.9\nLocation: Til'or Prime\nReporter: Thakar Venn\nNews Corporation: Stellar News Network (SNN)\nHeadline: Til'or Prime Commemorates Unity Day with Cross-Species Festival\nArticle: The diverse inhabitants of Til'or Prime came together today to celebrate Unity Day with a vibrant festival honoring the planet's rich cultural heritage and spirit of cooperation. The festival featured traditional dances, music performances, and culinary delights from various species represented on Til'or Prime, including Andorian ice sculptures, Vulcan meditation workshops, and Bajoran spiritual ceremonies. Ambassador Shala, representing the Federation, praised Til'or Prime as a shining example of interstellar harmony and unity.\n",

	"blurb_2": "Stardate: 83926.4\nLocation: Vulcan, Shi'Kahr\nReporter: Sivak\nNews Corporation: Interstellar News Network (INN)\nHeadline: Shi'Kahr Hosts Symposium on Psionic Research and Meditation Techniques\nArticle: The city of Shi'Kahr on Vulcan hosted a prestigious symposium today, bringing together leading experts in psionic research and meditation techniques from across the galaxy. Attendees participated in workshops and panel discussions exploring the latest advancements in telepathy, empathy, and other psionic abilities, as well as the therapeutic benefits of meditation practices. T'Pela, a renowned Vulcan neuroscientist, delivered the keynote address, emphasizing the importance of mastering one's mind and emotions for personal growth and spiritual enlightenment.\n",

	"blurb_3": "Stardate: 95672.1\nLocation: Bajor, Kendra Province\nReporter: Elara\nNews Corporation: Galactic News Corporation (GNC)\nHeadline: Kendra Province Honors Heroes of the Resistance with Memorial Ceremony\nArticle: Kendra Province on Bajor held a solemn memorial ceremony today to honor the heroes of the Bajoran Resistance who fought valiantly against the Cardassian occupation during the tumultuous years of the Occupation. The ceremony, attended by dignitaries, veterans, and members of the community, included speeches, musical tributes, and the laying of wreaths at the Memorial Plaza in memory of those who made the ultimate sacrifice for Bajor's freedom. Kai Opaka, spiritual leader of Bajor, delivered a moving eulogy, reminding attendees of the enduring legacy of courage and resilience forged by the Resistance.\n"
}

# Accessing individual news blurbs
var blurb_1 = news_blurbs["blurb_1"]
var blurb_2 = news_blurbs["blurb_2"]
var blurb_3 = news_blurbs["blurb_3"]



# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("res://dialogic_timelines/timeline1.dtl")
	pass;
	# Example usage
	print("Headline of blurb 1:", blurb_1)
	print("Reporter of blurb 2:", blurb_2)

	var events : Array = []
	var text_event = DialogicTextEvent.new()
	text_event.text = blurb_1
	text_event.character = load("res://dialogic_characters/Sivak.dch")

	events.append(text_event)
	text_event.text = blurb_2
	text_event.character = load("res://dialogic_characters/Sivak.dch")
	events.append(text_event)

	var timeline : DialogicTimeline = DialogicTimeline.new()
	timeline.events = events
	# if your events are already resources, you need to add this:
	timeline.events_processed = true
	Dialogic.start(timeline)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event: InputEvent):
	# check if a dialog is already running
	if Dialogic.current_timeline != null:
		return

	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		Dialogic.start('chapterA')
		get_viewport().set_input_as_handled()
