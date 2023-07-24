package ht.project.entity;

public enum BsResults {
    LOW("result_3", "저혈당"),
    NORMAL("result_1", "건강"),
    HIGH_RISK("result_4", "당뇨 의심"),
    HIGH("result_2", "당뇨병");
	
    private final String cssClass;
    private final String resultText;

    BsResults(String cssClass) {
        this(cssClass, "");
    }

    BsResults(String cssClass, String resultText) {
        this.cssClass = cssClass;
        this.resultText = resultText;
    }

    public String getCssClass() {
        return cssClass;
    }

    public String getResultText() {
        return resultText;
    }
}
