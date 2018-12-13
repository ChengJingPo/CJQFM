#!/usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt
from sklearn.svm import SVC 

def plot_svc_decision_function(model, ax=None, plot_support=True):
  

     if ax is None:
          ax = plt.gca()

     xlim = ax.get_xlim()
     ylim = ax.get_ylim()
     x = np.linspace(xlim[0], xlim[1], 30)
     y = np.linspace(ylim[0], ylim[1], 30)
     Y, X = np.meshgrid(y, x)
     xy = np.vstack([X.ravel(), Y.ravel()]).T
     P = model.decision_function(xy).reshape(X.shape)
     ax.contour(X, Y, P, colors='k',
                   levels=[-1, 0, 1], alpha=0.5,
                   linestyles=['--', '-', '--'])

     if plot_support:
     	ax.scatter(model.support_vectors_[:, 0],
                       model.support_vectors_[:, 1],
                       s=300, linewidth=1,  edgecolors='blue', facecolors='none');
     ax.set_xlim(xlim)
     ax.set_ylim(ylim)

from sklearn.datasets.samples_generator import make_blobs
X, y = make_blobs(n_samples=50, centers=2,           
                      random_state=0, cluster_std=0.60)
plt.scatter(X[:, 0], X[:, 1], c=y, s=50, cmap='autumn');
plt.show()

model = SVC(kernel='linear')
model.fit(X, y)

plt.scatter(X[:, 0], X[:, 1], c=y, s=50, cmap='autumn')
plot_svc_decision_function(model);
plt.show()

#model = SVC(kernel='linear')
model = SVC(kernel='rbf',C = 1000)
model.fit(X, y)
plt.scatter(X[:, 0], X[:, 1], c=y, s=50, cmap='autumn')
plot_svc_decision_function(model)
plt.show()

model = SVC(kernel='rbf',C = 1000)
#model = SVC(kernel='linear', C=10.0)
model.fit(X, y)

plt.scatter(X[:, 0], X[:, 1], c=y, s=50, cmap='autumn')
plot_svc_decision_function(model)
plt.show()


from sklearn.datasets.samples_generator import make_circles

X, y = make_circles(100, factor=.1, noise=.1)

plt.scatter(X[:, 0], X[:, 1], c=y, s=50, cmap='autumn');
plt.show()

#model = SVC(kernel='linear')
model = SVC(kernel='rbf',C = 1000)
model.fit(X, y)

plt.scatter(X[:, 0], X[:, 1], c=y, s=50, cmap='autumn')
plot_svc_decision_function(model);
plt.show()



from mpl_toolkits import mplot3d
def plot_3D(elev=30, azim=30, X=None, y=None):
        ax = plt.subplot(projection='3d')
        r = np.exp(-(X ** 2).sum(1))
        ax.scatter3D(X[:, 0], X[:, 1], r, c=y, s=50, cmap='autumn')
        ax.view_init(elev=elev, azim=azim)
        ax.set_xlabel('x')
        ax.set_ylabel('y')
        ax.set_zlabel('r')

plot_3D(X=X, y=y)
plt.show()


model = SVC(kernel='rbf',C = 1000)
model.fit(X, y)

plt.scatter(X[:, 0], X[:, 1], c=y, s=50, cmap='autumn')
plot_svc_decision_function(model);
plt.show()