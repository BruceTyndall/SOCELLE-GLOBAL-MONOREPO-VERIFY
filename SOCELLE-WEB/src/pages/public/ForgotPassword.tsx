import { useState } from 'react';
import { Helmet } from 'react-helmet-async';
import { Link } from 'react-router-dom';
import { Mail, AlertCircle, CheckCircle, Home } from 'lucide-react';
import { supabase } from '../../lib/supabase';

export default function ForgotPassword() {
  const [email, setEmail] = useState('');
  const [error, setError] = useState('');
  const [success, setSuccess] = useState(false);
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setSuccess(false);
    setLoading(true);

    const { error: resetError } = await supabase.auth.resetPasswordForEmail(email, {
      redirectTo: window.location.origin + '/reset-password'
    });

    if (resetError) {
      setError(resetError.message);
      setLoading(false);
    } else {
      setSuccess(true);
      setLoading(false);
    }
  };

  if (success) {
    return (
      <div className="min-h-screen bg-pro-ivory flex items-center justify-center p-4">
        <Helmet><title>Password Reset Sent — Socelle</title></Helmet>
        <div className="w-full max-w-md">
          <Link
            to="/portal/login"
            className="flex items-center gap-2 text-pro-warm-gray hover:text-pro-charcoal mb-6 transition-colors"
          >
            <Home className="w-4 h-4" />
            <span className="text-sm">Back to Login</span>
          </Link>

          <div className="bg-white rounded-lg shadow-sm p-8 border border-pro-stone">
            <div className="flex items-center justify-center mb-6">
              <div className="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
                <CheckCircle className="w-6 h-6 text-green-600" />
              </div>
            </div>

            <h1 className="text-2xl font-bold text-center text-pro-charcoal mb-2">
              Check Your Email
            </h1>
            <p className="text-center text-pro-warm-gray mb-6">
              Check your email for reset instructions
            </p>

            <div className="p-4 bg-pro-cream border border-pro-stone rounded-lg">
              <p className="text-sm text-pro-navy">
                If you don't see the email, check your spam folder.
              </p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-pro-ivory flex items-center justify-center p-4">
      <Helmet><title>Forgot Password — Socelle</title></Helmet>
      <div className="w-full max-w-md">
        <Link
          to="/"
          className="flex items-center gap-2 text-pro-warm-gray hover:text-pro-charcoal mb-6 transition-colors"
        >
          <Home className="w-4 h-4" />
          <span className="text-sm">Back to Home</span>
        </Link>

        <div className="bg-white rounded-lg shadow-sm p-8 border border-pro-stone">
          <div className="flex items-center justify-center mb-6">
            <div className="w-12 h-12 bg-pro-stone rounded-lg flex items-center justify-center">
              <Mail className="w-6 h-6 text-pro-navy" />
            </div>
          </div>

          <h1 className="text-2xl font-bold text-center text-pro-charcoal mb-2">
            Reset Your Password
          </h1>
          <p className="text-center text-pro-warm-gray mb-6">
            Enter your email and we'll send you a reset link
          </p>

          {error && (
            <div className="mb-4 p-3 bg-red-50 border border-red-200 rounded-lg flex items-start gap-2">
              <AlertCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
              <p className="text-sm text-red-700">{error}</p>
            </div>
          )}

          <form onSubmit={handleSubmit} className="space-y-4">
            <div>
              <label htmlFor="email" className="block text-sm font-medium text-pro-charcoal mb-2">
                Email Address
              </label>
              <input
                id="email"
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
                className="w-full px-4 py-2 border border-pro-stone rounded-lg focus:ring-2 focus:ring-pro-navy focus:border-pro-navy"
                placeholder="you@example.com"
              />
            </div>

            <button
              type="submit"
              disabled={loading}
              className="w-full py-3 bg-pro-navy text-white font-semibold rounded-lg hover:bg-pro-charcoal disabled:bg-pro-warm-gray disabled:cursor-not-allowed transition-colors"
            >
              {loading ? 'Sending...' : 'Submit'}
            </button>
          </form>
        </div>
      </div>
    </div>
  );
}
