package ht.project.entity;

public enum BsResults {
    LOW("result_3", "저혈당", "cir1"),
    NORMAL("result_1", "건강", "cir2"),
    HIGH_RISK("result_4", "당뇨 의심", "cir4"),
    HIGH("result_2", "당뇨병", "cir3");
	
	private final String cssClass;
    private final String resultText;
    private final String cssCircle;

    BsResults(String cssClass, String resultText, String cssCircle) {
        this.cssClass = cssClass;
        this.resultText = resultText;
        this.cssCircle = cssCircle;
    }

    public String getCssClass() {
        return cssClass;
    }

    public String getResultText() {
        return resultText;
    }

    public String getCssCircle() {
        return cssCircle;
    }
}
