package ht.project.entity;

public enum BpResults {
    LOW("result_3", "저혈압", "cir1"),
    LOW_RISK("result_3", "저혈압 의심", "cir1"),
    NORMAL("result_1", "건강", "cir2"),
    HIGH_RISK("result_2", "고혈압 의심", "cir3"),
    HIGH("result_2", "고혈압", "cir3");

    private final String cssClass;
    private final String resultText;
    private final String cssCircle;

    BpResults(String cssClass, String resultText, String cssCircle) {
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

