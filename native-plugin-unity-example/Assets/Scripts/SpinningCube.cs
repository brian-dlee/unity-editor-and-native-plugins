using UnityEngine;

public class SpinningCube : MonoBehaviour
{
    public float speed;
    private Transform _transform;

    void Start() {
        _transform = GetComponent<Transform>();
    }

    void Update ()
    {
        _transform.Rotate(Vector3.up, speed * Time.deltaTime);
    }
}
